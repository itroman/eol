require 'spec_helper'

describe "DataObjects" do
    
    describe "#get_data_objects" do
      it "returns a DataObjects object" do
        VCR.use_cassette('data_objects/get_data_objects') do
          results = DataObjects.get_data_objects('30073527')
          expect(results.class).to eq(DataObjects)
        end
      end
    end
end