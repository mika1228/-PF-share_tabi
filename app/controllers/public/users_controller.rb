class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @posts = @user.posts.page(params[:page]).per(5).order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def withdraw
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :age, :sex, :introduction)
  end

end
