require 'news_api'

class SourcesController < ApplicationController
  def index
  end

  #manually create
  def new
  end

  def create
  end

  private 
  def source_params
    params.require(:source).permit(:code, :name, :description, :url, :url_image :category, :language, :country_code, :country_name)
  end
end
