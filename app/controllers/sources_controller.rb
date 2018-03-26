require 'news_api'

class SourcesController < ApplicationController
  before_action :authorize
  before_action :check_admin, except: [:search]

  def index
    @sources = Source.all
  end

  def search
    @sources = Source.all

    filter_params(params).each do |key,value|
      @sources = @sources.public_send(key,value) if value.present?
    end
  end

  def custom_source
    news = params[:news]
    api = NewsApi.new
    @custom_info = api.custom(news)['sources']

    if @custom_info.nil?
      flash[:error] = "Connection Error. Please try again later"
    end

    respond_to do |format|
      format.js
    end

  end

  #set daily schedule to run. include button for manual run
  def import_sources
    #call api
    api = NewsApi.new
    api_info = api.get_sources['sources']
    api_source_codes = []

    if api_info.nil?
      flash[:error] = "Connection Error. Please try again later"
    else
    #update to db
      api_info.each_with_index do |source,i|
        news = api_info[i]
        
        api_source_codes << news["id"]

        if Source.find_by_code(code=news["id"]).nil?
          Source.create(code: news["id"], name: news["name"], description: news["description"], url: news["url"], category: news["category"], language: news["language"], country_code: news["country"])
        else
          source = Source.where("code='#{news["id"]}'")

          source.each_with_index do |s,i|
            s.update(code: news["id"], name: news["name"], description: news["description"], url: news["url"], category: news["category"], language: news["language"], country_code: news["country"])
          end
        end
      end

      #remove from db
      Source.all.each do |db|
        (db.destroy) if !api_source_codes.include?(db.code)
      end

      flash[:success] = "Updated"
      redirect_to admin_index_path
    end
  end

  def 

  #manually create sources -- add if theres time
  def new
  end

  def create
  end

  def destroy
    @source = Source.find(params[:id])
    @source.destroy

    flash[:success] = "Deleted"
    redirect_to sources_path

  end

  private 
  def filter_params(param)
    params.slice(:check_sources)
  end

  def source_params
    params.require(:source).permit(:code, :name, :description, :url, :category, :language, :country_code)
  end
end
