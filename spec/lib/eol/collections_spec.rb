require 'spec_helper'

describe Eol::Collections do
  
  describe "#initialize" do
    subject {Eol::Collections}
    
    include_examples "argument errors"
    
  end
  
  subject(:collections) { Eol::Collections.new({'name' => name, 
  'description' => description, 'logo_url' => logo_url, 'created' => created, 
  'modified' => modified, 'total_items' => total_items, 
  'item_types' => item_types, 'collection_items' => collection_items}) }
    
    context "A Collections object with data values" do
  
      let(:name) {"EOL Group on Flickr"}
      let(:description) {"This group allows anyone to provide images and videos 
                          for the Encyclopedia of Life web site."}
      let(:logo_url) {"http://media.eol.org/content/2011/08/30/11/95200_130_130.jpg"}
      let(:created) {"2013-03-01T01:18:12Z"}
      let(:modified) {"2016-03-29T14:20:01Z"}
      let(:total_items) {200049}
      let(:item_types) {[{"item_type":"TaxonConcept","item_count":49}]}
      let(:collection_items) {[{"name":"Salix alba L.",
                                "object_type":"TaxonConcept",
                                "object_id":1264966}]}
      
      it { is_expected.to be_a(Eol::Collections) }
      
      it_behaves_like "a class with attributes"
      
      it { is_expected.to have_attributes(:name => String) }
      it { is_expected.to have_attributes(:description => String) }
      it { is_expected.to have_attributes(:logo_url => 
           a_string_starting_with('http:') )}
      it { is_expected.to have_attributes(:created => String) }
      it { is_expected.to have_attributes(:modified => String) }
      it { is_expected.to have_attributes(:total_items => Integer) }
      it { is_expected.to have_attributes(:item_types => Array) }
      it { is_expected.to have_attributes(:collection_items => Array) }
      
      it_behaves_like "enumerable"
      
    end
end
