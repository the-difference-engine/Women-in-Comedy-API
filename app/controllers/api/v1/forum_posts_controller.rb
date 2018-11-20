class Api::V1::ForumPostsController < ApplicationController
    # before_action :find_forum_post, only: [:show, :edit, :update, :destroy]

    def index
        forum_posts =ForumPost.all
        render json: forum_posts 
    end
    
    def new
        @forum_post = ForumPost.new
    end
    
    def create 
        # @forum_post = ForumPost.new(forum_post_params)

        # if @forum_post.save
        #     redirect_to @forum_post
        # else 
        #     render 'new'
        # end

        forum_post = ForumPost.create(
            title: params[:title],
            content: params[:content],
            userId: params[:userId]
        )

        render json: forum_post 

    end

    def show 
        forum_post = ForumPost.find(params[:id])

        render json: forum_post

    end

    def edit
    end

    def update
        if @forum_post.update
            redirect_to @forum_post
        else
            render 'edit'
        end
    end

    def destroy
        @forum_post.destroy 
        redirect_to root_path
    end
    

private 
    def forum_post_params
        params.require(:forum_post).permit(:title, :content)
    end

    def find_forum_post
        @forum_post = ForumPost.find(params[:id])
    end
end
