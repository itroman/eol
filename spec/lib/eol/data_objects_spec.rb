require 'spec_helper'

describe Eol::DataObjects do
  
  describe "#initialize" do
    subject {Eol::DataObjects}
    
    include_examples "argument errors"
    
  end
  
  subject(:data_objects) {Eol::DataObjects.new({'identifier' => identifier,
                                                   'scientificName' => scientific_name, 
                                                   'exemplar' => exemplar,
                                                   'richness_score' => richness_score, 
                                                   'taxonConcepts' => taxon_concepts,
                                                   'dataObjects' => data_objects})}

  context "A DataObjects object with data values" do
    
    let(:identifier) {1045608}
    let(:scientific_name) {'Apis mellifera Linnaeus 1758'}
    let(:exemplar) {false}
    let(:richness_score) {400.0}
    let(:taxon_concepts) {[{"identifier":52191458,"scientificName":"Apis
                            mellifera Linnaeus 1758"}]}
    let(:data_objects) {[{"identifier":"715fac20e20b012e4c4f1e6699c0ad5e",
                          "dataObjectVersionID":13451158}]}
    
    it {is_expected.to be_a(Eol::DataObjects) }
    
    it_behaves_like "a class with attributes"
    
    it {is_expected.to have_attributes(:identifier => Integer) }
    it {is_expected.to have_attributes(:scientific_name => String) }
    it {is_expected.to have_attributes(:exemplar => FalseClass) }
    it {is_expected.to have_attributes(:richness_score => Float) }
    it {is_expected.to have_attributes(:taxon_concepts => Array) }
    it {is_expected.to have_attributes(:data_objects => Array) }
    
    it_behaves_like "enumerable"
    
  end
end
