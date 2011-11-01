require '../lib/csv_reader'
require '../lib/user_interface'

class TicketManager

  @@old_ticket_number= nil
  @@old_flight_price = nil

  def initialize

  end

  def self .old_ticket_number
    @@old_ticket_number
  end
    def self .old_flight_price
    @@old_flight_price
    end

  def self .reinitialize
    @@old_ticket_number=nil
    @@old_flight_price=nil
    end

  def add_details_to_ticket(ticket_found)

      ticket_found.flight = find_flight ticket_found.fl_id
      ticket_found.user= find_user ticket_found.us_email

  end

  def find_ticket ticket_number

      tickets = all_tickets

      ticket_found = nil

      tickets.each do | ticket |
          if ticket.ticket_number.to_s == ticket_number.to_s
             ticket_found = ticket
             add_details_to_ticket(ticket_found)
          end
      end

     return ticket_found

  end

  def print_tickets_from_user email

    tickets = find_tickets_from_user email

    puts 'Ticket Number | Departure | Destination '
    tickets.each do | ticket |
      puts ticket.ticket_number.to_s + ' '+ticket.fl_departure + ' '+ticket.fl_destination
    end

  end

  def enter_ticket_number(tickets)

      old_payment=nil
      puts 'Please enter the ticket number you would like to update '

      @@old_ticket_number=STDIN.gets.chomp
      tickets.each do |ticket|
        if (ticket.ticket_number == @@old_ticket_number)
          old_payment = ticket.payment
          break
        end
      end
      old_payment
   end

  def update_tickets email

    tickets = find_tickets_from_user email

    puts 'Ticket Number | Departure | Destination'
    tickets.each do | ticket |
      puts ticket.ticket_number.to_s + ' '+ticket.fl_departure + ' '+ticket.fl_destination
    end

    while(@@old_flight_price==nil)
       @@old_flight_price= enter_ticket_number(tickets)
    end

    puts '------------------Feel free to search for flights---------------'
    puts

  end


  def  find_tickets_from_user email

      tickets = all_tickets

      tickets_found = []

      tickets.each do | ticket |
          if ticket.us_email == email
             add_details_to_ticket(ticket)
             tickets_found.push ticket
          end
      end

      return tickets_found

  end

  def find_flight fl_id

      flights = all_flights

      flight_found = nil

      flights.each do |flight|
          if flight.fl_id.to_i == fl_id.to_i
            flight_found = flight
          end
      end
       return flight_found

  end


  def find_user email

      users = all_users
      user_found = nil

      users.each do |user|
          if user.email.to_s == email.to_s
            user_found = user
          end
      end

       return user_found
  end

  def print_ticket_details(ticket)
    puts
    puts 'Ticket number: '+ticket.ticket_number
    puts "________________________________________"
    puts 'Surname: '+ticket.user.l_name
    puts 'First name: '+ticket.user.f_name
    puts "________________________________________"
    puts 'Flight-ID: '+ticket.flight.fl_id
    puts
    puts 'Departure: '+ticket.flight.fl_departure+' Time: '+ ticket.flight.fl_departure_time
    puts 'Destination: '+ticket.flight.fl_destination+' Time: ' + ticket.flight.fl_arrival_time
  end

  def print_ticket_prompt

    puts 'Please enter the ticket number of your flight'
    ticket_number=STDIN.gets.chomp

    print_ticket ticket_number

  end

  def print_ticket ticket_number

      ticket= find_ticket ticket_number

      if ticket!=nil
        print_ticket_details ticket
      else
        puts 'Ticket number not found'
        puts

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