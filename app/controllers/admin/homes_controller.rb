class Admin::HomesController < ApplicationController
  
  def top
    @users = User.all
    @users = User.page(params[:page]).per(10)
  end
  
end
