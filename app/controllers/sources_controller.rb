require 'news_api'

class SourcesController < ApplicationController
  before_action :authorize
  before_action :check_admin

  def index
    @sources = Source.all
  end

  #set daily schedule to run. include button for manual run
  def import_sources
    #call api
    api = NewsApi.new
    api_info = api.get_sources['sources']
    api_source_codes = []
    
    #update to db
      api_info.each_with_index do |source,i|
        news = api_info[i]
        
        api_source_codes << news["id"]

        if Source.find_by_code(news["id"]).nil?
          Source.create(code: news["id"], name: news["name"], description: news["description"], url: news["url"], category: news["category"], language: news["language"], country_code: news["country"])
        else
          Source.update(code: news["id"], name: news["name"], description: news["description"], url: news["url"], category: news["category"], language: news["language"], country_code: news["country"])
        end
      end

      #remove from db
      Source.all.each do |db|
        (db.destroy) if !api_source_codes.include?(db.code)
      end

      flash[:success] = "Updated"
      redirect_to 'admin/index'
      return
  end

  def 

  #manually create sources -- add if theres time
  def new
  end

  def create
  end

  def destroy
  end

  private 
  def source_params
    params.require(:source).permit(:code, :name, :description, :url, :category, :language, :country_code)
  end
end
