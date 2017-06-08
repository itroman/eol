require 'spec_helper'

describe "Hierarchy Entries" do
    
  describe "#hierarchy_entries" do
    it "returns a HierarchyEntries object" do
      VCR.use_cassette('hierarchy_entries/hierarchy_entries') do
        results = Eolife.hierarchy_entries('30408282')
        expect(results.class).to eq(Eolife::HierarchyEntries)
      end
    end
  end
end