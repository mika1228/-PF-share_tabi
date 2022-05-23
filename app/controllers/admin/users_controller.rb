class Admin::UsersController < ApplicationController
  
  def index
    @users = User.all
    @users = User.page(params[:page]).per(10)
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(6)
  end
  
end
