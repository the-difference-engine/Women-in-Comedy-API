class Api::V1::CommentsController < ApplicationController
	protect_from_forgery prepend: true
	skip_before_action :verify_authenticity_token

	def index
		@comments = Comment.all

		render 'index.json.jbuilder'
	end

    def create
		comment = Comment.create(
			body: params[:body],
            author_id: params[:authorId],
            post_id: params[:postId]
		)
		render json: comment
	end

	def fetch_post_comments
		id = request.headers['id'].to_i
		post = Post.find_by(id: id)
		comments = []
		post.comments.each do |comment|
			author = comment.author
			new_comment = {id: comment[:id],
			               postId: comment[:post_id], 
						   body: comment[:body], 
						   authorFirstName: author[:first_name], 
						   authorLastName: author[:last_name]}
			comments.push(new_comment)
		end
		render json: comments.reverse
	end

end


   