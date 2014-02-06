class OmniauthCallbacksController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    user.track_login(request.remote_ip)
    redirect_to root_url
  end

  def failure
    session[:user_id] = nil
    redirect_to root_url, notice: "Please login using GitHub"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You are now logged out"
  end
end
