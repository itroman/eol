require 'spec_helper'

describe Eol::ProviderHierarchies do
  
  describe "#initialize" do
    subject {Eol::ProviderHierarchies}
    
    include_examples "argument errors"
    
  end
  
  subject(:provider_hierarchies) {Eol::ProviderHierarchies.new({'id' => id, 'label' => label})}

  context "A ProviderHierarchies object with data values" do
    
    let(:id) {121}
    let(:label) {"AntWeb (Ant Species)"}
    
    it {is_expected.to be_a(Eol::ProviderHierarchies) }
    
    it_behaves_like "a class with attributes"
    
    it {is_expected.to have_attributes(:id => Integer) }
    it {is_expected.to have_attributes(:label => String) }
  
    it_behaves_like "enumerable"
  
  end
end
