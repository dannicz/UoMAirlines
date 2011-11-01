require "rspec"
require '../lib/ticket_manager'
require '../lib/ticket_number_creator'
require '../lib/ticket'

describe "Ticket Manager" do

  it "should create a different ticket number each time" do

    creator = TicketNumberCreator.new
    ticket1=creator.create_ticket_number
    ticket2=creator.create_ticket_number

      puts ticket1.to_s+' '+ticket2.to_s

    ticket1.should_not == ticket2

  end


  it "it should find a ticket" do

    ticket_number = 100
     manager = TicketManager.new

    ticket=manager.find_ticket ticket_number

    ticket.should_not == nil


  end

  it "should get all the tickets from the csv" do
    manager = TicketManager.new
    tickets=manager.all_tickets
    tickets.size.should>0

  end


  it "should find the user and flight details of a ticket" do

     ticket_number = 543
      manager = TicketManager.new

     ticket=manager.find_ticket ticket_number

     flight = ticket.flight
     user = ticket.user

     flight.should_not == nil && user.should_not ==nil

  end

  it "should find all the tickets from a user" do

    user_id= 'c@d.com'
    manager = TicketManager.new
    tickets = manager.find_tickets_from_user user_id

    tickets.size.should > 1

  end

  it "should print the details of the ticket" do

    ticket_number = 2
    manager = TicketManager.new
    manager.print_ticket ticket_number

  end

  it "should print the tickets of a user" do
     user_id= 'c@d.com'
     manager = TicketManager.new
     manager.print_tickets_from_user user_id
  end


end