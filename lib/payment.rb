class Payment
  attr_accessor :credit_card_no,:amount

  def credit_card_details

     puts 'Enter your Credit Card Number'
      @credit_card_no =  STDIN.gets.chomp
     valid = validate_credit_card
     if(valid == 0)
      puts 'Invalid Credit Card Number'
      credit_card_details
     end
  end


  def payment_amount flight
      puts 'Enter your Payment amount'
       @amount=STDIN.gets.chomp
      valid =  validate_payment_amount flight
      if(valid == 0)
        puts 'Invalid Amount Entered'
        payment_amount flight
      end
  end

  def validate_credit_card
       if(is_number?(@credit_card_no) && @credit_card_no.length == 16)
        valid = 1
       else valid = 0
       end
   return valid
  end

def is_number?(i)
  true if Float(i) rescue false
end


  def validate_payment_amount  flight
         if (is_number?(@amount) && @amount == flight.fl_price)
               valid = 1
         else
           valid = 0
         end
    return valid
  end

  def write_payment_details flight
      FasterCSV.open("../UoMAirlinesPaymentsDB.csv", "a") do |csv|
      csv << [UserInterface.user_name,flight.fl_id,flight.fl_departure,flight.fl_destination,@amount]
      end
    puts "Congratulations! Your ticket has been booked from "+flight.fl_departure+" to "+flight.fl_destination
end

  def payment_gateway flight
    credit_card_details
    payment_amount flight
    write_payment_details flight
  end

end