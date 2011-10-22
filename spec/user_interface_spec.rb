require "rspec"



describe "My behaviour" do

  it "should check for password validation" do
    subject=Customer.new
    subject.pass_word '12345678'

  end


  it "should do something" do

    #To change this template use File | Settings | File Templates.
    true.should == false
  end
end