require 'spec_helper'

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
      
    end 
    
    context "A search with query options" do
      VCR.use_cassette('search/searchoptions') do
      results = Eolife.search("Tolumnia bahamensis", exact: true, cache_ttl: 30)
    
        it "returns an Array" do
          expect(results.class).to eq(Array)
        end
    
      end
    end
    
    context "Error Handling" do
      subject { Eolife }
      it_behaves_like "a bad response", :search, 'tolumnia'
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
    
    end 
    
   context "Error Handling" do
     subject { Eolife }
     it_behaves_like "a bad response", :search_all, 'tolumnia'
    end
    
  end
  
  describe ".collections" do
    VCR.use_cassette('collections/collections') do
    results = Eolife.collections('176')
    
      it "returns a Collections object" do
        expect(results.class).to eq(Eolife::Collections)
      end
    
    end
    
    context ".collections with query options" do
      VCR.use_cassette('collections/collectionsoptions') do
      results = Eolife.collections('176', sort_by: 'oldest', cache_ttl: 30)
    
        it "returns a Collections object" do
          expect(results.class).to eq(Eolife::Collections)
        end
    
      end
    end
    
    
    context "Error Handling" do
      subject { Eolife }
      it_behaves_like "a bad response", :collections, '176'
    end
    
  end

  describe ".ping" do
    VCR.use_cassette('ping/ping') do
    results = Eolife.ping
        
      it "returns a Ping object" do
        expect(results.class).to eq(Eolife::Ping)
      end
      
    end
    
    context "Error Handling" do
      subject { Eolife }
      it_behaves_like "a bad response", :ping
    end
    
  end

  describe ".pages" do
    VCR.use_cassette('pages/pages') do
    results = Eolife.pages('1045608')
        
      it "returns a Pages object" do
        expect(results.class).to eq(Eolife::Pages)
      end
      
    end
    
     context ".pages with query options" do
      VCR.use_cassette('pages/pagesoptions') do
      results = Eolife.pages('1045608', images_per_page: 10, videos_per_page: 10, cache_ttl: 30)
    
        it "returns a Pages object" do
          expect(results.class).to eq(Eolife::Pages)
        end
    
      end
    end
    
    
    context "Error Handling" do
      subject { Eolife }
      it_behaves_like "a bad response", :pages, '1045608'
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
    
    context "Error Handling" do
      subject { Eolife }
      it_behaves_like "a bad response", :provider_hierarchies
    end
  
  end
  
  describe ".data_objects" do
    VCR.use_cassette('data_objects/data_objects') do
    results = Eolife.data_objects('30073527')
    
      it "returns a DataObjects object" do
        expect(results.class).to eq(Eolife::DataObjects)
      end
      
    end
    
    context ".data_objects with query options" do
      VCR.use_cassette('data_objects/data_objectsoptions') do
      results = Eolife.data_objects('30073527', language: 'it', cache_ttl: 30)
    
        it "returns a DataObjects object" do
          expect(results.class).to eq(Eolife::DataObjects)
        end
    
      end
    end
    
    
    context "Error Handling" do
      subject { Eolife }
      it_behaves_like "a bad response", :data_objects, '30074527'
    end
    
    
  end
  
  describe ".hierarchies" do
    VCR.use_cassette('hierarchies/hierarchies') do
    results = Eolife.hierarchies('1188')
    
      it "returns a Hierarchies object" do
        expect(results.class).to eq(Eolife::Hierarchies)
      end
      
    end
    
    context ".hierarchies with query options" do
      VCR.use_cassette('hierarchies/hierarchies_options') do
      results = Eolife.hierarchies('1188', language: 'de', cache_ttl: 30)
    
        it "returns a Hierarchies object" do
          expect(results.class).to eq(Eolife::Hierarchies)
        end
    
      end
    end
    
    
    context "Error Handling" do
      subject { Eolife }
      it_behaves_like "a bad response", :hierarchies, '1188'
    end
    
    
  end
  
  describe ".hierarchy_entries" do
    VCR.use_cassette('hierarchy_entries/hierarchy_entries') do
    results = Eolife.hierarchy_entries('30408282')
      
      it "returns a HierarchyEntries object" do
        expect(results.class).to eq(Eolife::HierarchyEntries)
      end
      
    end
    
    context ".hierarchy_entries with query options" do
      VCR.use_cassette('hierarchy_entries/hierarchy_entries_options') do
      results = Eolife.hierarchy_entries('30408282', common_names: true, synonyms: true, cache_ttl: 30)
    
        it "returns a HierarchyEntries object" do
          expect(results.class).to eq(Eolife::HierarchyEntries)
        end
    
      end
    end
    
    context "Error Handling" do
      subject { Eolife }
      it_behaves_like "a bad response", :hierarchy_entries, '30408282'
    end
    
  end
  
  describe ".search_by_provider" do
    VCR.use_cassette('search_by_provider/search_by_provider') do
    results = Eolife.search_by_provider('180542', 903)
    
      it "returns a SearchByProvider object" do
        expect(results[0].class).to eq(Eolife::SearchByProvider)
      end
    
    end
    
    context ".search_by_provider with query options" do
      VCR.use_cassette('search_by_provider/search_by_provider_options') do
      results = Eolife.search_by_provider('180542', 903, batch: true, cache_ttl: 30)
    
        it "returns a SearchByProvider object" do
          expect(results[0].class).to eq(Eolife::SearchByProvider)
        end
    
      end
    end
    
    
    context "Error Handling" do
      subject { Eolife }
      it_behaves_like "a bad response", :hierarchy_entries, '180542', 903
    end
    
  end
  
  describe "response isn't an HTTParty::Response" do
    subject { Eolife }
  
  it "returns a StandardError, Unknown Error" do
    response = 'badjuju'
    expect{subject.send(:bad_response, response)}.to raise_error(StandardError, 'Unknown Error')
  end
end
end
