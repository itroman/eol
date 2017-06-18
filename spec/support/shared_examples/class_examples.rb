shared_examples "argument errors" do 
  it "errors when called with no arguments" do
    expect { subject.new }.to raise_error(ArgumentError)
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
