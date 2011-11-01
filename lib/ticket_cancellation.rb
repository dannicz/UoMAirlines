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

        add_to_cancellation_history ticket.ticket_number,ticket.user.email,ticket.payment
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