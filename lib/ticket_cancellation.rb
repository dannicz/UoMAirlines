require "../lib/ticket_manager"

class TicketCancellation

  def read_tickets
    tickets_reader = CSVReader.new
    tickets_reader.all_tickets
  end

  def update_file(ticketsArray)
    FasterCSV.open("../UoMAirlinesPaymentsDB.csv", "w+") do |csv|
      csv << ["ticket_number,us_Email", "fl_Id", "fl_Departure", "fl_Destination", "payment"]
    end

    i = 0
    ticketsArray.each do |ticket|

      if (i!= 0 && ticket.ticket_number != nil)

        FasterCSV.open("../UoMAirlinesPaymentsDB.csv", "a") do |csv|
          csv << [ticket.ticket_number, ticket.user.email, ticket.flight.fl_id, ticket.flight.fl_departure, ticket.flight.fl_destination, ticket.payment]
        end
      end
      i = 1

    end
  end

  def delete_ticket ticket_number

    ticketsArray  = read_tickets

    i = 0

    ticketsArray.each do |ticket|
      i = i+1
      if(ticket.ticket_number.to_i == ticket_number.to_i)

        #manager= TicketManager.new
        #manager.add_details_to_ticket ticket
        add_to_cancellation_history ticket.ticket_number,ticket.user.email,ticket.payment

        send=Send_email.new
        ticket_mngr = TicketManager.new
        ticket_mngr.add_details_to_ticket(ticket)
        time = Time.now()
        currentTime = "#{time.day}/#{time.month}/#{time.year} at #{time.hour}:#{time.min}:#{time.sec}"
        message = "Ticket successfully cancelled!\n\nTicket number: #{ticket_number.to_s}\nSurname: #{ticket.user.l_name}\nFirstname: #{ticket.user.f_name}\nFlight ID: #{ticket.flight.fl_id}\nDeparture Town: #{ticket.flight.fl_departure}\nDestination Town: #{ticket.flight.fl_destination}\nDeparture Time: #{ticket.flight.fl_departure_time}\nArrival Time: #{ticket.flight.fl_arrival_time.to_s}\nThe amount of #{ticket.payment} £ will be returned to your account.\n\nMessage created on : #{currentTime}\n"
        send.send_email(ticket.user.email,ticket.user.f_name,message)

        ticket.ticket_number = nil
      end
    end
    update_file(ticketsArray)
  end

  def add_to_cancellation_history  ticket_number, email, payment
       FasterCSV.open("../UoMAirlinesCancellationsDB.csv", "a") do |csv|
        csv << [ticket_number, email, payment]
       end
    end

end
