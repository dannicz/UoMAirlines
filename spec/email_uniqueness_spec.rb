require "rspec"
require "../lib/user_interface"

describe "e-mail uniqueness" do

  it "should check for email uniqueness" do
      ui = UserInterface.new
      email = 'makis@gmail.com'
      #If it exists then it is false
      result =ui.check_unique_email email
      result.should == true
  end

end