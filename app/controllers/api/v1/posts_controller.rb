class Api::V1::PostsController < ApplicationController
  protect_from_forgery prepend: true

  def index
    @posts = Post.all
    render 'index.json.jbuilder'
  end

  def show
    @post = Post.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @post = Post.find(params[:id])
    # TODO: This was broken; now it's probably broken in a different way
    @post.update(params)
    render 'show.json.jbuilder'
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def create
    # TODO: We should just be able to pass params here
    post = Post.create(
      body: params[:body],
      postable_id: params[:userId],
      postable_type: 'User',
      author_id: params[:authorId]
    )
    render json: post
  end

  def event_post
    Post.create(
      body: params[:body],
      postable_id: params[:eventId],
      postable_type: 'Event',
      author_id: params[:authorId]
    )
  end
end
