require "rspec"
require "../lib/login"

require "../lib/payment"

describe Payment do
  let(:flight) {mock('Flight')}

  it "should be a valid credit card number" do
    subject.credit_card_no ='1234567887654321'

    subject.validate_credit_card.should be_true
  end


  it "should be an invalid credit card number because it has chars" do

    subject.credit_card_no ='abc4567887654321'

    subject.validate_credit_card.should be_false
  end

  it "should be an invalid credit card number because it is too long" do

    subject.credit_card_no ='1234321435423532543543546534567887654321'

    subject.validate_credit_card.should be_false
  end

  it "should not be a valid payment" do

    flight.stub!(:fl_price).and_return(400)

    subject.amount=500
    subject.validate_payment_amount(flight).should be_false
  end

  it "should be a valid payment" do

    flight.stub!(:fl_price).and_return(400)

    subject.amount=400
    subject.validate_payment_amount(flight).should be_true
  end


end



