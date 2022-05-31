class Admin::PostCommentsController < ApplicationController
  
  def index
    @post_comments = PostComment.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to admin_post_comments_path
  end
  
end
