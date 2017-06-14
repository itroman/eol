shared_examples "argument errors" do 
  it "errors when called with no arguments" do
    expect { subject.new }.to raise_error(ArgumentError)
  end
end

shared_examples "empty object" do
 
 it "has attributes with only nil values" do
   subject.map do |attribute|
     expect(attribute).to be_nil
   end
 end
 
end