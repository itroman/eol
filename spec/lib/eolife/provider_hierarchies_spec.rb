require 'spec_helper'

describe Eolife::ProviderHierarchies do
  
  describe "#initialize" do
    subject {Eolife::ProviderHierarchies}
    
    include_examples "argument errors"
    
  end
  
  subject(:provider_hierarchies) {Eolife::ProviderHierarchies.new({'id' => id, 'label' => label})}

  context "A ProviderHierarchies object with data values" do
    
    let(:id) {121}
    let(:label) {"AntWeb (Ant Species)"}
    
    it {is_expected.to be_a(subject.class) }
    
    it_behaves_like "a class with attributes"
    
    it {is_expected.to have_attributes(:id => Integer) }
    it {is_expected.to have_attributes(:label => String) }
  
    it_behaves_like "enumerable"
  
  end
end
