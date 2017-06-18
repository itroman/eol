require 'spec_helper'

describe Eolife::Pages do
  
  describe "#initialize" do
    subject {Eolife::Pages}
    
    include_examples "argument errors"
    
  end
  
    subject(:pages) {Eolife::Pages.new({'scientificName' => scientific_name, 
                                       'richness_score' => richness_score, 
                                       'taxonConcepts' => taxon_concepts,
                                       'dataObjects' => data_objects})}

  context "A Pages object with data values" do
    
    let(:scientific_name) {'Apis mellifera Linnaeus 1758'}
    let(:richness_score) {400.0}
    let(:taxon_concepts) {[{"identifier":52191458,"scientificName":"Apis
                            mellifera Linnaeus 1758"}]}
    let(:data_objects) {[{"identifier":"715fac20e20b012e4c4f1e6699c0ad5e",
                          "dataObjectVersionID":13451158}]}
    
    it {is_expected.to be_a(subject.class) }
    
    it_behaves_like "a class with attributes"
    
    it {is_expected.to have_attributes(:scientific_name => String) }
    it {is_expected.to have_attributes(:richness_score => Float) }
    it {is_expected.to have_attributes(:taxon_concepts => Array) }
    it {is_expected.to have_attributes(:data_objects => Array) }
    
    it_behaves_like "enumerable"
    
  end
end
