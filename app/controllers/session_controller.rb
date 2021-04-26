class SessionController < ApplicationController

  def new

  end

  def create
    user = User.find_by :username => params[:username]
    if user.present?
      session[:username] = user.username
      redirect_to root_path
    else
      flash[:error_message] = "Invalid username"
      redirect_to login_path
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_path
  end

end
