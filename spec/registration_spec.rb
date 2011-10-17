require "rspec"
require "../lib/customer"
require "../lib/registration"

describe Customer do

  it "should check for password validation" do
    subject=Customer.new 'sumayh', 'aljameel', 'address', 'email', '12345678'
    subject.password.length.should>=8

  end

  it "should register a user to the database" do

    customer = Customer.new 'sumayh', 'aljameel', 'address', 'email'  , '12345678'

    registration = Registration.new
    result = registration.add_customer customer

    result == true
  end

end