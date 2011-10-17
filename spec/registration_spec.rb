require "rspec"
require "../lib/usersLogin"
require "../lib/registration"

describe UsersLogin do

  it "should check for password validation" do
    subject=Customer.new
    subject.pass_word '12345678'

  end

  it "should register a user to the database" do
    customer = Customer.new

    registration = Registration.new
    result = registration.add_customer customer

    result == true
  end


end