require 'spec_helper'
require 'vcr'

shared_examples "argument errors" do 
  it "errors when called with no arguments" do
    expect { subject.new }.to raise_error(ArgumentError)
  end
end

shared_examples "error message"  do |method|
    
    it "returns an error" do
        WebMock.stub_request(:get, "http://eol.org/api/search/1.0/tolumnia.json").
        with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(status: 500, body: "[]", headers: {})
    expect{Eolife.method}.to raise_error
    
  end
end



shared_examples "a class with attributes" do
    
  @attr = described_class.new("").instance_variables.map {|attrib| attrib.to_s.gsub('@', '').to_sym }
  @attr.each do |attrib|
    it "responds to ##{attrib}" do
      expect(subject).to respond_to(attrib)
    end
  end
  
end

shared_examples "enumerable" do
  
    it "can be iterated through" do
      expect(subject.flat_map{|x| x}).to_not be_nil
    end

end
