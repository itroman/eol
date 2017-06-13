require 'spec_helper'

describe Eolife::Search do
  
  describe "#initialize" do
    
    it "should raise an error when called with no arguments" do
       expect { Eolife::Search.new}.to raise_error(ArgumentError)
    end
    
  end
  
  subject(:search) { Eolife::Search.new( {id: id, title: title, link: link, 
                      content: content }) }
  
    context "An empty Search object" do
    
      let(:id) {nil}
      let(:title) {nil}
      let(:link) {nil}
      let(:content) {nil}
  
      it { is_expected.to be_a(Eolife::Search) }
      
      it "has attributes with nil values" do
        expect(search.id).to eq(nil)
        expect(search.title).to eq(nil)
        expect(search.link).to eq(nil)
        expect(search.content).to eq(nil)
      end
      
  end
    
    context "A non-empty Search object" do
  
      let(:id) {1128718}
      let(:title) {"Tolumnia bahamensis (Nash) Braem"}
      let(:link) {"http://eol.org/1128718?action=overview&controller=taxa"}
      let(:content) {"Tolumnia x adamsii Sauleda"}
      
      it { is_expected.to be_a(Eolife::Search) }
      
      
      it { is_expected.to have_attributes(:id => Integer) }
      it { is_expected.to have_attributes(:title => String) }
      it { is_expected.to have_attributes(:link => 
           a_string_starting_with('http:') )}
      it { is_expected.to have_attributes(:content => String) }
      
  end

end
