class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find(params[:user][:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to :signin
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
