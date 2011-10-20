class Payment
  attr_accessor :credit_card_no,:amount

  def credit_card_details

     puts 'Enter your Credit Card Number'
    valid = validate_credit_card
    if(valid == 0)
      puts 'Invalid Credit Card Number'
      credit_card_details
    end
  end

  def payment_amount flight
         puts 'Enter your Payment amount'
      valid =  validate_payment_amount flight
   if(valid == 0)
      puts 'Invalid Amount Entered'
      payment_amount flight
    end
  end

  def validate_credit_card
       if(Float(credit_card_no) && credit_card_no.length == 16)
             valid = 1
       end
    else valid = 0
    return valid
  end

  def validate_payment_amount  flight
         if (amount == flight.price)
               valid = 1
         else
           valid = 0
         end
    return valid
  end

end