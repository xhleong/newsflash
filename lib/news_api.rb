require 'httparty'

class NewsApi

  include HTTParty

  base_uri 'newsapi.org'


  def get_sources
    response = self.class.get("/v2/sources?apiKey=#{ENV['NEWS_API_KEY']}")
    if response.success?
      response
    else
      raise "#{response.response}"
    end
  end

  def default
    response = self.class.get("/v2/top-headlines?country=us&language=en&category=general&apiKey=#{ENV['NEWS_API_KEY']}")
    if response.success?
      response
    else
      raise "#{response.response}"
    end
  end

  def custom(news)
    response = self.class.get("/v2/top-headlines?sources=#{news}&apiKey=#{ENV['NEWS_API_KEY']}")
    if response.success?
      response
    else
      raise "#{response.response}"
    end
  
end
