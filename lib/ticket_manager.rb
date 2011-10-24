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

  def find_flight fl_id

      flights = all_flights

      flight_found = nil

      flights.each do |flight|
          if flight.fl_id == fl_id
            flight_found = flight
          end
      end
       return flight_found
  end

  def find_user email

      users = all_users

      user_found = nil

      users.each do |user|
          if user.email == email
            user_found = user
          end
      end
       return user_found
  end

  def print_ticket ticket_number

      ticket= find_ticket ticket_number
      flight = find_flight ticket.fl_id
      user= find_user ticket.us_email
      if ticket!=nil

        puts 'Surname: '+user.l_name
        puts 'Firstname: '+user.f_name
        puts "________________________________________"
        puts 'Ticket number: '+ticket_number
        puts 'Flight-ID: '+flight.fl_id
        puts
        puts 'Departure: '+flight.fl_departure+' Time: '+ flight.fl_departure_time
        puts 'Destination: '+flight.fl_destination+' Time: ' + flight.fl_destination_time

      end
  end

  def all_tickets
      csv_reader = CSVReader.new()
      tickets=csv_reader.all_tickets
      tickets
  end

  def all_flights
     csv_reader = CSVReader.new()
      flights=csv_reader.all_flights
      flights

  end

  def all_users
     csv_reader = CSVReader.new()
     users=csv_reader.all_users
     users

  end

end