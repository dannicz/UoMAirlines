require "rspec"
require "../lib/login"

describe "My behaviour" do

  it "Login should fail with incorrect credentials" do
    login = LogIn.new
    username = "c@d.com"
    pass = "456789456999999"
    user = login.check_credentials username,pass
    user.should == nil
  end

  it "Username cannot be empty" do
    login = LogIn.new
    username = ""
    pass = "456789456999999"
    user = login.check_credentials username,pass
    user.should == nil
  end

  it "Password cannot be empty" do
    login = LogIn.new
    username = "c@d.com"
    pass = ""
    user = login.check_credentials username,pass
    user.should == nil
  end

  it "should be a successful login" do
    login = LogIn.new
    username = "c@d.com"
    pass = "456789456"
    user = login.check_credentials username,pass
    user.should_not == nil
  end


end