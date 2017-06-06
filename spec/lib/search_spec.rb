require 'spec_helper'

describe "A Search" do
  VCR.use_cassette('search/search') do
  results = Search.search("tolumnia")
    
    describe "#search" do
        
      it "returns an Array of Search objects" do
        expect(results.class).to eq(Array)
        expect(results[0].class).to eq(Search)
      end
      
      it "each Search object has four attributes" do
        expect(results[0].id).to be_a(Integer)
        expect(results[0].title).to be_a(String)
        expect(results[0].link).to be_a(String)
        expect(results[0].content).to be_a(String)
      end
        
    end
  end
end