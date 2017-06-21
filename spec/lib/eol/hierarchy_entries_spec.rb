require 'spec_helper'

describe Eol::HierarchyEntries do
  
  describe "#initialize" do
    subject {Eol::HierarchyEntries}
    
    include_examples "argument errors"
    
  end
  
    subject(:pages) {Eol::HierarchyEntries.new({'sourceIdentifier' => source_identifier, 
                                       'parentNameUsageID' => parent_name_usage_id, 
                                       'taxonConceptID' => taxon_concept_id,
                                       'scientificName' => scientific_name,
                                       'source' => source, 
                                       'nameAccordingTo' => name_according_to,
                                       'vernacularNames' => vernacular_names,
                                       'synonyms' => synonyms,
                                       'ancestors' => ancestors,
                                       'children' => children})}
                                       
  context "A HierarchyEntries object with data values" do
    
    let(:source_identifier) {"taxon:142651"}
    let(:parent_name_usage_id) {27889944}
    let(:taxon_concept_id) {46698412}
    let(:scientific_name) {"Actaea alba (L.) Mill."}
    let(:source) {"http://eol.org/pages/46698412/hierarchy_entries/30408282/overview"}
    let(:name_according_to) {["Initial BioLib.cz Import"]}
    let(:vernacular_names) {[]}
    let(:synonyms) {[]}
    let(:ancestors) {[{"taxonID":27889936,"parentNameUsageID":0}]}
    let(:children) {[]}
    
    it {is_expected.to be_a(Eol::HierarchyEntries) }
    
    it_behaves_like "a class with attributes"
    
    it { is_expected.to have_attributes(:source_identifier => String) }
    it { is_expected.to have_attributes(:parent_name_usage_id => Integer) }
    it { is_expected.to have_attributes(:taxon_concept_id => Integer) }
    it { is_expected.to have_attributes(:scientific_name => String) }
    it { is_expected.to have_attributes(:source => a_string_starting_with('http:')) }
    it { is_expected.to have_attributes(:name_according_to => Array) }
    it { is_expected.to have_attributes(:vernacular_names => Array) }
    it { is_expected.to have_attributes(:synonyms => Array) }
    it { is_expected.to have_attributes(:ancestors => Array) }
    it { is_expected.to have_attributes(:children => Array) }
    
    it_behaves_like "enumerable"
    
  end
end
