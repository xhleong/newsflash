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
end
