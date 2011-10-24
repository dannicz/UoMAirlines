class Ticket
    attr_accessor :ticket_number,:us_email, :fl_id, :fl_departure,:fl_destination,:payment, :flight, :user

   def initialize ticket_number, us_email,fl_id, fl_departure,fl_destination,payment
     @ticket_number =ticket_number
     @us_email =  us_email
     @fl_id=fl_id
    @fl_departure = fl_departure
    @fl_destination = fl_destination
    @payment=payment
  end

end