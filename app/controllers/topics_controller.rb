class TopicsController < ApplicationController

  before_action :find_user

  def new
    @topics = Topic.new
  end

  def create
    @topics = Topic.new(topic_params)
  end

  private

  def find_user
    @user = User.find_by_id(current_user.id)
  end

  def topic_params
    params[:topic].permit(languages:[], portals:[], categories:[], countries:[], keywords:[])
  end

end


