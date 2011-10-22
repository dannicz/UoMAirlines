require "rspec"
require "../lib/user_interface"



describe "User interface" do

  it "should check for password validation" do
    ui = UserInterface.new
    password = '12345678'

    ui.validate_password password

  end


  it "should check for email validation" do
    ui = UserInterface.new
    email = 'abc@hot.com'

    ui.validate_email email

  end

end