require "rspec"
require '../lib/ticket_manager'
require '../lib/ticket'

describe TicketManager do


  it "it should find a ticket" do

    ticket_number = 100
    ticket=subject.find_ticket ticket_number
    ticket.should_not == nil

  end

  it "should get all the tickets from the csv" do
    tickets=subject.all_tickets
    tickets.size.should>0

  end


  it "should find the user and flight details of a ticket" do

     ticket_number = 543
     ticket=subject.find_ticket ticket_number
     flight = ticket.flight
     user = ticket.user
     flight.should_not == nil && user.should_not ==nil

  end

  it "should find all the tickets from a user" do

    user_id= 'c@d.com'
    tickets = subject.find_tickets_from_user user_id

    tickets.size.should > 1

  end

  it "should print the details of the ticket" do

    ticket_number = 2
    subject.print_ticket ticket_number

  end

  it "should print the tickets of a user" do
     user_id= 'c@d.com'
     subject.print_tickets_from_user user_id
  end


end
