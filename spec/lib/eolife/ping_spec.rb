require 'spec_helper'

describe Eolife::Ping do
  
  describe "#initialize" do
    subject {Eolife::Ping}
    
    include_examples "argument errors"
    
  end

  subject(:ping) { Eolife::Ping.new('message' => message) }
  
  context "A Ping object with nil values" do
    
    let(:message) {nil}
    
    it { is_expected.to be_a(subject.class) }
    
  end
  
end
