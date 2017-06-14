require 'spec_helper'

describe "Hierarchies" do
    
  describe "#hierarchies" do
    it "returns a Hierarchies object" do
      VCR.use_cassette('hierarchies/hierarchies') do
        results = Eolife.hierarchies('1188')
        expect(results.class).to eq(Eolife::Hierarchies)
      end
    end
  end
end