require "rspec"
require "../lib/login"

describe LogIn do

  it "Login should fail with incorrect credentials" do
    username = "c@d.com"
    pass = "456789456999999"
    user = subject.check_credentials username,pass
    user.should == nil
  end

  it "Username cannot be empty" do
    username = ""
    pass = "456789456999999"
    user = subject.check_credentials username,pass
    user.should == nil
  end

  it "Password cannot be empty" do
    username = "c@d.com"
    pass = ""
    user = subject.check_credentials username,pass
    user.should == nil
  end

  it "should be a successful login" do
    username = "c@d.com"
    pass = "12345678"
    user = subject.check_credentials username,pass
    user.should_not == nil
  end


end