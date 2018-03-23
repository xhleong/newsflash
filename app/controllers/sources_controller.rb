require 'news_api'

class SourcesController < ApplicationController
  def index
  end

  #set daily schedule to run. include button for manual run
  def import_sources
    api = NewsApi.new
    api.get_sources['sources'].each do |source|
      if Source.find_by_code(source["id"])!
        Source.create(code: source["id"], name: source["name"], description: source["description"], url: source["url"], category: source["category"], language: source["language"], country: source["country"])
      else
        Source.update(code: source["id"], name: source["name"], description: source["description"], url: source["url"], category: source["category"], language: source["language"], country: source["country"])
      end
    end
  end

  def 

  #manually create sources
  def new
  end

  def create
  end

  private 
  def source_params
    params.require(:source).permit(:code, :name, :description, :url, :category, :language, :country_code)
  end
end
