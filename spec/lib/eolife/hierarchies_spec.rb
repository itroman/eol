require 'spec_helper'

describe Eolife::Hierarchies do
  
  describe "#initialize" do
    subject {Eolife::Hierarchies}
    
    include_examples "argument errors"
    
  end
  
    subject(:hierarchies) {Eolife::Hierarchies.new({'title' => title, 
                                       'contributor' => contributor, 
                                       'dateSubmitted' => date_submitted,
                                       'source' => source, 'roots' => roots})}

  context "A Hierarchies object with data values" do
    
    let(:title) {"Species 2000 & ITIS Catalogue of Life: April 2013"}
    let(:contributor) {"Catalogue of Life"}
    let(:date_submitted) {"2013-03-30 19:53:45"}
    let(:source) {""}
    let(:roots) {[{"sourceIdentifier":"13021388","taxonID":51521761}]}
    
    it {is_expected.to be_a(subject.class) }
    
    it_behaves_like "a class with attributes"
    
    it {is_expected.to have_attributes(:title => String) }
    it {is_expected.to have_attributes(:contributor => String) }
    it {is_expected.to have_attributes(:date_submitted => String) }
    it {is_expected.to have_attributes(:source => String) }
    it {is_expected.to have_attributes(:roots => Array) }
    
    it_behaves_like "enumerable"
    
  end
end
