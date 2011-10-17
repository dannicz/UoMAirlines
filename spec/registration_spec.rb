require "rspec"
require "registration.rb"

describe Registration do

  it "should check for password validation" do
    subject.password.length.should >= 8
  end

end