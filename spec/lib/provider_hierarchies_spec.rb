require 'spec_helper'

describe "ProviderHierarchies" do
    
  describe "#provider_hierarchies" do
    it "returns a ProviderHierarchies object" do
      VCR.use_cassette('provider_hierarchies/provider_hierarchies') do
        results = Eolife.provider_hierarchies
        expect(results[0].class).to eq(Eolife::ProviderHierarchies) # should be returns an array of provider_hierarchies objects
      end
    end
  end
end