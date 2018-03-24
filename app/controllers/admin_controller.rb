class AdminController < ApplicationController
  before_action :authorize
  before_action :check_admin

  def index
  end

  private
  

end
