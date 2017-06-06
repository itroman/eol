require 'spec_helper'

describe "Pages" do
    
    describe "#get_pages" do
      it "returns a Pages object" do
        VCR.use_cassette('pages/get_pages') do
          results = Pages.get_pages('1045608')
          expect(results.class).to eq(Pages)
        end
      end
    end
end