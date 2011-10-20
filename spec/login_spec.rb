require "rspec"
require "../lib/login"

describe "My behaviour" do

  it "should not be a successful login" do
    login = LogIn.new
    username = "wronguser"
    pass = "wrongpass"
    user = login.check_credentials username,pass

    user.should == nil
  end


  it "should be a successful login" do
    login = LogIn.new
    username = "aaa"
    pass = "bbb"
    user = login.check_credentials username,pass

    user.should != nil
  end

end