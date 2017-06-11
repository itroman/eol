require 'spec_helper'

describe "SearchByProvider" do
    
  describe "#search_by_provider" do
    it "returns a SearchByProvider object" do
      VCR.use_cassette('search_by_provider/search_by_provider') do
        results = Eolife.search_by_provider('180542', 903)
        expect(results[0].class).to eq(Eolife::SearchByProvider)
      end
    end
  end
end