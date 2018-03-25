class ApplicationController < ActionController::Base


  private
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def authorize
      if current_user.nil?
        flash[:error] = "Sign up or log in to access content"
        redirect_to login_url
      end
    end

    def check_admin
      !current_user.admin ? (redirect_to root_url) : (return)
    end
    
end
