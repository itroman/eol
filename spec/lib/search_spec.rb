require 'spec_helper'

describe "A Search object" do
  subject(:search) { Eolife::Search.new( {id: id, title: title, link: link, 
                    content: content }) }
  let(:id) {1128718}
  let(:title) {"Tolumnia bahamensis (Nash) Braem"}
  let(:link) {"http://eol.org/1128718?action=overview&controller=taxa"}
  let(:content) {"Tolumnia x adamsii Sauleda"}
      
      it "each Search object has four attributes" do
        expect(search.id).to be_a(Integer)
        expect(search.title).to be_a(String)
        expect(search.link).to be_a(String)
        expect(search.content).to be_a(String)
      end
      
      it "links to a website" do
        expect(search.link).to include "http:"
      end
        
    
  
end
