require "rspec"
require "../lib/user_interface"

describe UserInterface do

  it "should check for password validation" do
    password = '12345678'
    result = subject.validate_password password
    result.should == true
  end

  it "should check for email validation" do
    email = 'ab@chot.com'
    result =subject.validate_email email
    result.should == true
  end

  it "should check that the given e-mail is unique in the database" do
    email = 'makis@gmail.com'
    result =subject.is_email_unique email
    result.should == true

  end

end