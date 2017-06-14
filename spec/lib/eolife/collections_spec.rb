require 'spec_helper'

describe "Collections" do
    
  describe "#get_collections" do
    it "returns a Collections object" do
      VCR.use_cassette('collections/collections') do
        results = Eolife.collections('176')
        expect(results.class).to eq(Eolife::Collections)
      end
    end
  end
end
