require "rspec"
require "../lib/usersLogin"
require "../lib/registration"

describe UsersLogin do

  it "should check for password validation" do
    subject=UsersLogin.new 'sumayh', 'aljameel', 'address', 'email', '12345678'
    subject.password.length.should>=8

  end

  it "should register a user to the database" do

    customer = UsersLogin.new 'sumayh', 'aljameel', 'address', 'email'  , '12345678'

    registration = Registration.new
    result = registration.add_customer customer

    result == true
  end

end