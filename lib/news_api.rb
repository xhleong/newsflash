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
    default_country = 'us'
    default_language = 'en'
    default category = 'general'
    response = self.class.get("/v2/top-headlines?country=#{default_country}&language=#{default_language}&category=#{default_category}&apiKey=#{ENV['NEWS_API_KEY']}")
    if response.success?
      response
    else
      raise "#{response.response}"
    end
  end
  
end
