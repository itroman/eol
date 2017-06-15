require 'spec_helper'

describe Eolife::SearchByProvider do
  
  describe "#initialize" do
    subject {Eolife::SearchByProvider}
    
    include_examples "argument errors"
    
  end
  
  subject(:search_by_provider) {Eolife::SearchByProvider.new({'eol_page_id' => eol_page_id, 'eol_page_link' => eol_page_link})}

  context "A SearchByProvider object with nil values" do
    
    let(:eol_page_id) {nil}
    let(:eol_page_link) {nil}
    
    it { is_expected.to be_a(subject.class) }
    it { is_expected.to have_attributes(:eol_page_id => nil) }
    it { is_expected.to have_attributes(:eol_page_link => nil) }
    
  end
  
  context "A SearchByProvider object with data values" do
    
    let(:eol_page_id) {328580}
    let(:eol_page_link) {"eol.org/pages/328580"}
    
    it {is_expected.to be_a(subject.class) }
    it {is_expected.to have_attributes(:eol_page_id => Integer) }
    it {is_expected.to have_attributes(:eol_page_link => String) }
  
  end
end
