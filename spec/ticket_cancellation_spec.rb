require "rspec"
require "../lib/ticket_cancellation"
require "../lib/csv_reader"
require "../lib/ticket_manager"
require "../lib/user_writer"

describe TicketCancellation do

  before do
    user_writer = UserWriter.new
	  user_writer.create_users_db_unless_exists

    ticket_manager= TicketManager.new
    ticket_manager.create_tickets_db_unless_exists

    flight= Flight.new 1,'Manchester','Dubai','12:00','18:00',350
    ticket= ticket_manager.create_new_ticket flight,'admin@hotmail.com',500
    ticket_manager.save_ticket ticket
  end


  it "should delete a ticket from the flights CSV file" do

    csv_reader = CSVReader.new()
    tickets = csv_reader.all_tickets

    old_number_of_tickets=tickets.size

    ticket_number = tickets[tickets.size-1].ticket_number
    subject.delete_ticket ticket_number,false

    tickets = csv_reader.all_tickets
    new_number_of_tickets= tickets.size

    new_number_of_tickets.should == old_number_of_tickets-1

  end

end
