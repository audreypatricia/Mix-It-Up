class UsersController < ApplicationController

  def index
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @playlists = @spotify_user.playlists
    session[:user] = request.env['omniauth.auth']

  end

  def new

    @user = User.new

  end

  def create
    username = user_params[:username]
    user = User.find_by_username username
    session[:username] = user.username


    redirect_to users_path

  end


  private
  def user_params
    params.require(:user).permit(:username)
  end
end
