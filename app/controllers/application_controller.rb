class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user  
  helper_method :current_user, :redirect_if_logged_in
  private
  def current_user
    @current_user ||= User.find(session[:user_id])# if session[:user_id]
  end

  def redirect_if_logged_in!
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    redirect_to new_survey_path and return if @current_user.present?
  end


end
