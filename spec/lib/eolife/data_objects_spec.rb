require 'spec_helper'

describe "DataObjects" do
    
  describe "#data_objects" do
    it "returns a DataObjects object" do
      VCR.use_cassette('data_objects/data_objects') do
        results = Eolife.data_objects('30073527')
        expect(results.class).to eq(Eolife::DataObjects)
      end
    end
  end
end
