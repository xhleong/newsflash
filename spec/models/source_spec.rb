require 'rails_helper'

RSpec.describe Source, type: :model do

source = Source.create(code: 'abc', name: 'abc-news', description:"abc news is the best", url:"www.news.com", category: "business", language: 'en', country_code:'MY')


  context "validation: " do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code) }
  end

  context "search" do
    it "should find the results by source" do
      # source
      result = Source.check_sources(source.name)

      expect{(result).to eq([source])}

    end
  end

end