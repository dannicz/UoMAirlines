require "rspec"
require "../lib/search_flights"

describe SearchFlights do

  before do

  end

  it "should find flights" do

    departure = "Manchester"
    destination = "Dubai"
    foundFlights = subject.findFlights departure,destination

    foundFlights.size.should > 0
  end


end