require 'spec_helper'

describe Eol::Ping do
  
  describe "#initialize" do
    subject {Eol::Ping}
    
    include_examples "argument errors"
    
  end
  
  context "A Ping object with data" do
    
    subject(:ping) {Eol::Ping.new('Success')}
    
    it {is_expected.to be_a(Eol::Ping) }
    
    it_behaves_like "a class with attributes"
    
    it {is_expected.to have_attributes(:message => String) }
  
  end
end
