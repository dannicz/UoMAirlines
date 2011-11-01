require "rspec"
require "../lib/user_interface"

describe "User interface" do

  it "should check for password validation" do
    ui = UserInterface.new
    password = '12345678'

    result = ui.validate_password password
    result.should == true
  end

  it "should check for email validation" do
    ui = UserInterface.new
    email = 'ab@chot.com'

    result =ui.validate_email email
    result.should == true
  end

  it "should check for unique email " do
    ui = UserInterface.new

    ui.is_email_unique('a@b.com').should == true

  end

end