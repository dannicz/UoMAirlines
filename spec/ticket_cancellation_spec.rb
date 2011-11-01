require "rspec"
require "../lib/ticket_cancellation"
require "../lib/csv_reader"

describe TicketCancellation do

  it "confirm cancellation" do

    csv_reader = CSVReader.new()
    ticket_cancellation = TicketCancellation.new
    tickets = csv_reader.all_tickets

    initial_rows=tickets.size

    ticket_number = 113
    ticket_cancellation.delete_ticket ticket_number

    tickets = csv_reader.all_tickets
    final_rows= tickets.size

    final_rows.should == initial_rows-1

  end
end