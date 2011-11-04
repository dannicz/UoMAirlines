require "rspec"
require '../lib/ticket_manager'
require '../lib/ticket'
require "../lib/user_writer"

describe TicketManager do

  before do
    subject.create_tickets_db_unless_exists
    subject.create_flights_db_unless_exists
    user_writer = UserWriter.new
    user_writer.create_users_db_unless_exists
  end

  it "it should create and save a ticket in the CSV file" do
    flight= Flight.new 1,'Manchester','Dubai','12:00','18:00',350
    ticket= subject.create_new_ticket flight,'admin@hotmail.com',500
    subject.save_ticket ticket

  end

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




end

