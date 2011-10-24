require "rspec"
require '../lib/ticket_manager'

describe "Ticket Manager" do

  it "should create a different ticket number each time" do

    manager = TicketManager.new
    ticket1=manager.create_ticket_number
    ticket2=manager.create_ticket_number

      puts ticket1.to_s+' '+ticket2.to_s

    ticket1 != ticket2

  end

  it "it should find a ticket" do

    ticket_number = 1
     manager = TicketManager.new

    ticket=manager.find_ticket ticket_number

    ticket != nil


  end

  it "should get all the tickets from the csv" do
    manager = TicketManager.new
    tickets=manager.all_tickets
    tickets.size.should>0

  end


  it "should find the user and flight details of a ticket" do

     ticket_number = 1
      manager = TicketManager.new

     ticket=manager.find_ticket ticket_number

     flight = ticket.flight
     user = ticket.user

     flight != nil && user!=nil

  end


end