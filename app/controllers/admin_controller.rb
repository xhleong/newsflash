class AdminController < ApplicationController
  before_action :authorize
  before_action :check_admin

  def index
  end

  private
  
  def check_admin
    !current_user.admin ? (redirect_to root_url) : (return)
  end

end
