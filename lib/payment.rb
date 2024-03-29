require '../lib/ticket_number_creator'
require "../lib/ticket_manager"
require "../lib/email"

class Payment
  attr_accessor :credit_card_no,:amount

  def credit_card_details

     puts 'Enter your Credit Card Number: '
     @credit_card_no =  gets.chomp
     valid = validate_credit_card
     if(!valid)
      puts 'Invalid Credit Card Number'
      credit_card_details
     end
  end


  def payment_amount flight
      puts "The price for this ticket is " +flight.fl_price.to_s+" GBP"
      puts 'Enter your Payment amount'
      @amount = gets.chomp
      valid =  validate_payment_amount flight
      if(!valid )
        puts 'Invalid Amount Entered'
        payment_amount flight
      end
  end

  def validate_credit_card
      is_number?(@credit_card_no) && @credit_card_no.length == 16

  end

def is_number?(i)
  true if Float(i) rescue false
end

  def validate_payment_amount  flight
    is_number?(@amount) && @amount.to_i == flight.fl_price.to_i

  end

  def send_email_confirmation(flight, refund, send, ticket_number, user)
    price = @amount
    time = Time.now()
    currentTime = "#{time.day}/#{time.month}/#{time.year} at #{time.hour}:#{time.min}:#{time.sec}"
    if (refund)
      message = "Ticket successfully changed!\n\nTicket number: #{ticket_number.to_s}\nSurname: #{user.l_name}\nFirstname: #{user.f_name}\nFlight ID: #{flight.fl_id}\nDeparture Town: #{flight.fl_departure}\nDestination Town: #{flight.fl_destination}\nDeparture Time: #{flight.fl_departure_time}\nArrival Time: #{flight.fl_arrival_time.to_s}\nThe amount of #{price.to_s} £ will be refunded to your account\n\nMessage created on : #{currentTime}\n"
    else
      message = "Ticket successfully booked!\n\nTicket number: #{ticket_number.to_s}\nSurname: #{user.l_name}\nFirstname: #{user.f_name}\nFlight ID: #{flight.fl_id}\nDeparture Town: #{flight.fl_departure}\nDestination Town: #{flight.fl_destination}\nDeparture Time: #{flight.fl_departure_time}\nArrival Time: #{flight.fl_arrival_time.to_s}\nPrice: #{price.to_s} £\n\nMessage created on : #{currentTime}\n"
    end
    send.send_email(UserInterface.user_name, user.f_name, message)
  end




  def write_payment_details flight, refund

      ticket_mngr = TicketManager.new
      user = ticket_mngr.find_user(UserInterface.user_name)

      new_ticket = ticket_mngr.create_new_ticket(flight, UserInterface.user_name,@amount)
      ticket_number = new_ticket.ticket_number

      ticket_mngr.save_ticket new_ticket

      puts ''
      puts '                        Payment Successful !!!'
      puts "Congratulations! Your ticket has been booked from "+flight.fl_departure+" to "+flight.fl_destination
      puts ''
      puts 'A copy of your ticket has been mailed to your e-mail address'
      puts ''

      sender=Send_email.new
      send_email_confirmation(flight, refund, sender, ticket_number, user)

  end

  def payment_gateway flight
    puts ''
    puts '------------ Redirecting to Payment gateway ------------'
    puts ''
    credit_card_details
    payment_amount flight
    write_payment_details flight, false
  end

end
