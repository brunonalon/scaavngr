class SessionsController < ApplicationController

  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.ip_address = ip_address
    @user.save
    session[:user_id] = @user.id
    redirect_to items_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
