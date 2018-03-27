require 'news_api'

class UsersController < ApplicationController

  before_action :authorize, only: [:dashboard, :show, :edit, :update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully signed up"
      redirect_to dashboard_user_path
    else
      flash[:error] = "Failed to create"
      render "new"
    end

  end

  def dashboard
      @user = User.find(params[:id])

      #call default api
      api = NewsApi.new

      @api_default = api.default['articles']

      if api.default['articles'].nil?
        flash[:error] = "Site is currently not working. Please try again later"
        redirect_to dashboard_user_path(current_user)
      end

    end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end


end


