require 'spec_helper'
require 'vcr'

shared_examples "argument errors" do 
  it "errors when called with no arguments" do
    expect { subject.new }.to raise_error(ArgumentError)
  end
end

shared_examples "a bad response"  do |method, param|
  
  codes = [400, 401, 403, 404, 500]
  
  codes.each do |num|
    it "returns error code #{num}" do 
        WebMock.stub_request(:get, "http://eol.org/api/#{method}/1.0/#{param}.json").
        with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(status: num, body: "[]", headers: {})
    expect {subject.send(method, param)}.to raise_error(HTTParty::Error, "Error code #{num}")
  end
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
