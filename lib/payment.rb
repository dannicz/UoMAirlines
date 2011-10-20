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
       else valid = 0
       end
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

  def write_payment_details flight
      FasterCSV.open("../UoMAirlinesPaymentsDB.csv", "a") do |csv|
      csv << [UserInterface.user_name,flight.id,flight.fl_Departure,flight.fl_Destination,@amount]
  end

  def payment_gateway flight
    credit_card_details
    payment_amount flight
    write_payment_details flight
  end

end

end