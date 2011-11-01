require "rspec"
require "../lib/user"
require "../lib/registration"


describe Registration do


  it "should register a user to the database" do
    user = User.new "Sophia","Meng","12341234","sophia@meng.com","Whitworth Park","client"
    registration = Registration.new
    registration.add_customer(user).should be_true

  end

end