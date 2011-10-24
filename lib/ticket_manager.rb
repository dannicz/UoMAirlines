require '../lib/csv_reader'

class TicketManager

  def create_ticket_number
   random_number = rand(100000)
   #check that the number is not yet in the csv

  random_number
  end

  def find_ticket ticket_number

      tickets = all_tickets

      ticket_found = nil

      tickets.each do | ticket |
          if ticket.ticket_number == ticket_number
             ticket_found = ticket
          end
      end

      return ticket_found

  end

  def print_ticket ticket_number

      ticket= find_ticket ticket_number
      if ticket!=nil
          #print ticket details

      end
  end

  def all_tickets
      csv_reader = CSVReader.new()
      tickets=csv_reader.all_tickets
      tickets
  end


end