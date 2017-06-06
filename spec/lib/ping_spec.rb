require 'spec_helper'

describe "A Ping" do
    
    describe "#api_status" do
      it "returns a Ping object" do
        VCR.use_cassette('ping/api_status') do
          results = Ping.api_status
          expect(results.class).to eq(Ping)
        end
      end
    end
end