class ApplicationController < ActionController::Base


  private
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def authorize
      flash[:error] = "Sign up or log in to access content"
      redirect_to login_url if current_user.nil?
    end
end
