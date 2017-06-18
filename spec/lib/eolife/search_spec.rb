require 'spec_helper'

describe Eolife::Search do
  
  describe "#initialize" do
    subject {Eolife::Search}
    
    include_examples "argument errors"
    
  end
  
  subject(:search) { Eolife::Search.new({'id' => id, 'title' => title, 'link' => link, 'content' => content }) }
  
    context "A Search object with data values" do
      
      let(:id) {123}
      let(:title) {"Tolumnia bahamensis (Nash) Braem"}
      let(:link) {"http://eol.org/1128718?action=overview&controller=taxa"}
      let(:content) {"Tolumnia x adamsii Sauleda"}
      
      it { is_expected.to be_a(Eolife::Search) }
      
      it_behaves_like "a class with attributes"
      
      it { is_expected.to have_attributes(:id => Integer) }
      it { is_expected.to have_attributes(:title => String) }
      it { is_expected.to have_attributes(:link => 
           a_string_starting_with('http:') )}
      it { is_expected.to have_attributes(:content => String) }
      
      it_behaves_like "enumerable"
    
  end
  
end
