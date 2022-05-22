class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "You have created post successfully."
      redirect_to post_path(@post.id)
    else
      @posts = Post.all
      render :index
    end
  end
  
  def index
    @posts = Post.all
  end
  
  def show
  end
  
  def edit
  end
  
  def destroy
  end
  
end
