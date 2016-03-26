class UsersController < ApplicationController
  respond_to :json, :html

  def new
    @user = User.new
  end

  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    if @user.save
      # Handle a successful save.
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  def index
    @user = current_user
    @items = current_user.get_all_user_items
    @current_item = current_item
  end
end
