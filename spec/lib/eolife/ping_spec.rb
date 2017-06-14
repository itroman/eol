require 'spec_helper'

describe Eolife::Ping do
  
  describe "#initialize" do
    subject {Eolife::Ping}
    
    include_examples "argument errors"
    
  end

  context "A Ping object with nil value" do
    
    subject(:ping) {Eolife::Ping.new(nil)}
    
    it { is_expected.to be_a(subject.class) }
    it { is_expected.to have_attributes(:message => nil) }
    
  end
  
  context "A Ping object with data" do
    
    subject(:ping) {Eolife::Ping.new('Success')}
    
    it {is_expected.to be_a(subject.class) }
    it {is_expected.to have_attributes(:message => String) }
  
  end
end
