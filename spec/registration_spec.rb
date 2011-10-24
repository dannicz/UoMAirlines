require "rspec"
require "../lib/user"
require "../lib/registration"


describe Registration do


  it "should register a user to the database" do
    user = User.new "","","","","",""
    registration = Registration.new
    result = registration.add_customer user
    result == true
  end

end