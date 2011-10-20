require "rspec"
require "../lib/login"
require "../lib/user_interface"
require "../lib/payment"

describe "My behaviour" do



  it "should be a valid credit card number" do
    payment = Payment.new
    payment.credit_card_no ='112123232'
  end

  it "should be correct payment amount" do
    payment = Payment.new
    payment.amount = '350'

  end

  end


