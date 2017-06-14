require 'spec_helper'

describe "Eolife module methods" do

  describe "#search" do
    VCR.use_cassette('search/search') do
    results = Eolife.search("tolumnia")

      it "returns an Array" do
        expect(results.class).to eq(Array)
      end
      
      it "contains Search objects" do
        expect(results[0].class).to eq(Eolife::Search)
      end
      
      it "has objects with four attributes" do
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
  
  describe "#collections" do
    VCR.use_cassette('collections/collections') do
    results = Eolife.collections('176')
    
      it "returns a Collections object" do
        expect(results.class).to eq(Eolife::Collections)
      end
    
    end
  
  end

  describe "#ping" do
    VCR.use_cassette('ping/ping') do
    results = Eolife.ping
        
      it "returns a Ping object" do
        expect(results.class).to eq(Eolife::Ping)
      end
      
      it "returns the state of the API" do
        expect(results.message).to eq("Success")
      end
      
    end
    
  end

end
