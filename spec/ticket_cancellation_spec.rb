require "rspec"
require "../lib/ticket_cancellation"
require "../lib/csv_reader"

describe TicketCancellation do

  it "should delete a ticket from the flights CSV file" do

    csv_reader = CSVReader.new()
    tickets = csv_reader.all_tickets

    old_number_of_tickets=tickets.size

    ticket_number = 113
    subject.delete_ticket ticket_number,false

    tickets = csv_reader.all_tickets
    new_number_of_tickets= tickets.size

    new_number_of_tickets.should == old_number_of_tickets-1

  end

end