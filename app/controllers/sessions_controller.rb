class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged In"
      if current_user.admin
        redirect_to admin_index_path
      else
        redirect_to dashboard_user_path(current_user)
      end
    else
      flash[:error] = "Invalid email or password"
      redirect_to root_url
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged Out"
    redirect_to root_url
  end

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

  # if: previously already logged in with OAuth
  if authentication.user
    user = authentication.user
    authentication.update_token(auth_hash)
    @find_user = User.find_by_email(auth_hash[:info][:email])
    session[:user_id] = @find_user.id
    @next_admin = admin_index_path
    @next_user = dashboard_user_path(current_user)
    @flash = "Successfully Signed In"
  # else: user logs in with OAuth for the first time
  else
    user = User.create_with_auth_and_hash(authentication, auth_hash)
    @find_user = User.find_by_email(auth_hash[:info][:email])
    session[:user_id] = @find_user.id
    # you are expected to have a path that leads to a page for editing user details
    @next_admin = admin_index_path
    @next_user = dashboard_user_path(current_user)
    @notice = "User created. Please confirm or edit details"
  end

    login_path('user')
    flash[:success] = @flash
    if current_user.admin
      redirect_to @next_admin
    else
      redirect_to @next_user
    end
  
  end

end
