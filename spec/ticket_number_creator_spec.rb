require "rspec"
require "../lib/ticket_number_creator"

describe TicketNumberCreator do

  it "should create a different ticket number each time" do

    ticket1=subject.create_ticket_number
    ticket2=subject.create_ticket_number

    ticket1.should_not == ticket2

  end

end