require '../lib/ticket_number_creator'

class Payment
  attr_accessor :credit_card_no,:amount

  def credit_card_details

     puts 'Enter your Credit Card Number : '
      @credit_card_no =  gets.chomp
     valid = validate_credit_card
     if(valid == 0)
      puts 'Invalid Credit Card Number'
      credit_card_details
     end
  end


  def payment_amount flight
      puts 'Enter your Payment amount'
       @amount = gets.chomp
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
      creator = TicketNumberCreator.new
      ticket_number = creator.create_ticket_number
      FasterCSV.open("../UoMAirlinesPaymentsDB.csv", "a") do |csv|
      csv << [ticket_number,UserInterface.user_name,flight.fl_id,flight.fl_departure,flight.fl_destination,@amount]
      end
      puts ''
      puts '                        Payment Successful !!!'
      puts "Congratulations! Your ticket has been booked from "+flight.fl_departure+" to "+flight.fl_destination
      puts ''
      puts 'Copy of ticket has been mailed to your email address'
      puts ''
  end

  def payment_gateway flight
    puts ''
    puts '------------- Redirecting to Payment gateway ------------'
    puts ''
    puts ''
    credit_card_details
    payment_amount flight
    write_payment_details flight
  end

end