require 'spec_helper'
require 'httparty'

describe "Eolife module methods" do

  describe ".search" do
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
  
  describe ".search_all" do
    VCR.use_cassette('search/search_all') do
    results = Eolife.search_all("tolumnia")

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
  
  describe ".collections" do
    VCR.use_cassette('collections/collections') do
    results = Eolife.collections('176')
    
      it "returns a Collections object" do
        expect(results.class).to eq(Eolife::Collections)
      end
    
    end
  end

  describe ".ping" do
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

  describe ".pages" do
    VCR.use_cassette('pages/pages') do
    results = Eolife.pages('1045608')
        
      it "returns a Pages object" do
        expect(results.class).to eq(Eolife::Pages)
      end
      
    end
  end
  
  describe ".provider_hierarchies" do
    VCR.use_cassette('provider_hierarchies/provider_hierarchies') do
    results = Eolife.provider_hierarchies
        
      it "returns an array" do
        expect(results.class).to eq(Array)
      end
        
      it "of ProviderHierarchies objects" do
        expect(results[0].class).to eq(Eolife::ProviderHierarchies)
      end
      
    end
  end
  
  describe ".data_objects" do
    VCR.use_cassette('data_objects/data_objects') do
    results = Eolife.data_objects('30073527')
    
      it "returns a DataObjects object" do
        expect(results.class).to eq(Eolife::DataObjects)
      end
      
    end
  end
  
  describe ".hierarchies" do
    VCR.use_cassette('hierarchies/hierarchies') do
    results = Eolife.hierarchies('1188')
    
      it "returns a Hierarchies object" do
        expect(results.class).to eq(Eolife::Hierarchies)
      end
      
    end
  end
  
  describe ".hierarchy_entries" do
    VCR.use_cassette('hierarchy_entries/hierarchy_entries') do
    results = Eolife.hierarchy_entries('30408282')
      
      it "returns a HierarchyEntries object" do
        expect(results.class).to eq(Eolife::HierarchyEntries)
      end
      
    end
  end
  
  describe ".search_by_provider" do
    VCR.use_cassette('search_by_provider/search_by_provider') do
    results = Eolife.search_by_provider('180542', 903)
    
      it "returns a SearchByProvider object" do
        expect(results[0].class).to eq(Eolife::SearchByProvider)
      end
    
    end
  end
end

describe "Error handling" do
  
  vcr_options = { :cassette_name => 'error/bad_request' }
  context "A search that returns a bad request", :vcr => vcr_options do
    
    it "raises error code 400: Bad Request" do
      expect{Eolife.search('tolumnia/error')}.to raise_error(HTTParty::Error, 'Error code 400')
    end
    
  end
  
  vcr_options = { :cassette_name => 'error/unauthorized' }
  context "A search that returns unauthorized", :vcr => vcr_options do
    
    it "raises error code 401: Unauthorized" do
      expect{Eolife.search('tolumnia/error')}.to raise_error(HTTParty::Error, 'Error code 401')
    end
    
  end
  
  vcr_options = { :cassette_name => 'error/forbidden' }
  context "A search that returns forbidden", :vcr => vcr_options do
    
    it "raises error code 403: Forbidden" do
      expect{Eolife.search('tolumnia/error')}.to raise_error(HTTParty::Error, 'Error code 403')
    end
    
  end
  
  
  vcr_options = { :cassette_name => 'error/not_found' }
  context "A search that returns not found", :vcr => vcr_options do
    
    it "raises error code 404: Not Found" do
      expect{Eolife.search('1257.xml')}.to raise_error(HTTParty::Error, 'Error code 404')
    end
      
  end  
  
  vcr_options = { :cassette_name => 'error/internal_server' }
  context "A search that raises an internal server error ", :vcr => vcr_options do
    
    it "raises error code 500: Internal Server Error" do
      expect{Eolife.search('tolumnia/error')}.to raise_error(HTTParty::Error, 'Error code 500')
    end
  
  end
  
   # include_examples "error message", search('tolumnia')
  
    it "tests for errors" do
      stub_request(:get, "http://eol.org/api/search/1.0/tolumnia.json").
        with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(status: 500, body: "[]", headers: {})
     expect{Eolife.search("tolumnia")}.to raise_error(HTTParty::Error, 'Error code 500')
  end
  #context "A search that returns an unknown error" do
    
   # it "is expected to raise an Unknown Error" do
    #  VCR.turn_off!
    #    stub_request(:get, "http://eol.org/api/ping/1.0.json").
     #    with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).to_timeout
         
      #expect{Eolife.ping}.to raise_error
    #end
      
  #end

end
