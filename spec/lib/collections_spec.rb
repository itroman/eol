require 'spec_helper'

describe "Collections" do
    
    describe "#get_collections" do
      it "returns a Collections object" do
        VCR.use_cassette('collections/get_collections') do
          results = Collections.get_collections('176')
          expect(results.class).to eq(Collections)
        end
      end
    end
end