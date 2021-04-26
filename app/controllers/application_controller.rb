class ApplicationController < ActionController::Base
  before_action :fetch_user

  private
  def fetch_user
    @current_user = session[:user] 
    # session[:username].present?
    # session[:username] = nil unless @current_user.present?
  end

  def check_for_login
    redirect_to root_path unless @current_user.present?
  end

end
