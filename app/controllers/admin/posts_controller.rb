class Admin::PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @posts = Post.order(created_at: :desc)
  end
  
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
end
