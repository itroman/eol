require 'spec_helper'

describe "Pages" do
    
  describe "#pages" do
    it "returns a Pages object" do
      VCR.use_cassette('pages/pages') do
        results = Eolife.pages('1045608')
        expect(results.class).to eq(Eolife::Pages)
      end
    end
  end
end