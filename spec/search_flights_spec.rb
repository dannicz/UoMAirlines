require "rspec"
require "../lib/search_flights"
require "../lib/ticket_manager"

describe SearchFlights do

  before do
    ticket_manager= TicketManager.new
    ticket_manager.create_flights_db_unless_exists
  end


  it "should find flights" do

    departure = "Manchester"
    destination = "Dubai"
    foundFlights = subject.findFlights departure,destination

    foundFlights.size.should > 0
  end


end
