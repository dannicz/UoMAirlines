require "rspec"
require "../lib/login"

require "../lib/payment"

describe "My behaviour" do



  it "should be a valid credit card number" do
    payment = Payment.new
    payment.credit_card_no ='1234567887654321'

    payment.validate_credit_card.should == 1
  end


  end


