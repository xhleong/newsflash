require 'httparty'

class NewsApi

include HTTParty

  base_uri 'newsapi.org'


  def sources
    response = self.class.get("/v2/sources?#{ENV['NEWS_API_KEY']}")
    if response.success?
      response
    else
      raise response.response
    end
  end
