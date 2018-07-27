class Api::V1::CommentsController < ApplicationController
    protect_from_forgery prepend: true
	def index
		@comments = Comment.all

		render 'index.json.jbuilder'
	end

    def create
		comment = Comment.create(
			body: params[:body],
            author_id: params[:authorId]
            post_id: params[:postId]
		)
		render json: comment
	end

end


   