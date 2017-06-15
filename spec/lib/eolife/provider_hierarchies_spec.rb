require 'spec_helper'

describe Eolife::ProviderHierarchies do
  
  describe "#initialize" do
    subject {Eolife::ProviderHierarchies}
    
    include_examples "argument errors"
    
  end
  
  subject(:provider_hierarchies) {Eolife::ProviderHierarchies.new({'id' => id, 'label' => label})}

  context "A ProviderHierarchies object with nil values" do
    
    let(:id) {nil}
    let(:label) {nil}
    
    it { is_expected.to be_a(subject.class) }
    it { is_expected.to have_attributes(:id => nil) }
    it { is_expected.to have_attributes(:label => nil) }
    
  end
  
  context "A ProviderHierarchies object with data values" do
    
    let(:id) {121}
    let(:label) {"AntWeb (Ant Species)"}
    
    it {is_expected.to be_a(subject.class) }
    it {is_expected.to have_attributes(:id => Integer) }
    it {is_expected.to have_attributes(:label => String) }
  
  end
end
