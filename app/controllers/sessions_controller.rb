class SessionsController < ApplicationController

 def create
    user = User.from_omniauth(env["omniauth.auth"])
    user.create_survey_from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    render :text => env["omniauth.auth"].to_json
    #redirect_to new_survey_path
 end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
