require 'spec_helper'

describe "A Ping" do
  VCR.use_cassette('ping/ping') do
  results = Eolife.ping
    
    describe "#ping" do
      
      it "returns a Ping object" do
        expect(results.class).to eq(Eolife::Ping)
      end
      
      it "returns the state of the API" do
        expect(results.message).to eq("Success")
      end
      
    end
  end
end
