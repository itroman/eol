require 'spec_helper'

describe "A Search" do
  VCR.use_cassette('search/search') do
  results = Eolife.search("tolumnia")
    
    describe "#search" do
        
      it "returns an Array of Search objects" do
        expect(results.class).to eq(Array)
        expect(results[0].class).to eq(Eolife::Search)
      end
      
      it "each Search object has four attributes" do
        expect(results[0].id).to be_a(Integer)
        expect(results[0].title).to be_a(String)
        expect(results[0].link).to be_a(String)
        expect(results[0].content).to be_a(String)
      end
      
      it "title contains the search query" do
        expect(results[0].title).to include "Tolumnia"
      end
      
      it "links to a website" do
        expect(results[0].link).to include "http:"
      end
        
    end
  end
end