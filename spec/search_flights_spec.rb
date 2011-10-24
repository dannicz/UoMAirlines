require "rspec"
require "../lib/search_flights"

describe "My behaviour" do

  it "should find flights" do

    finder = SearchFlights.new
    departure = "Manchester"
    destination = "Dubai"
    foundFlights = finder.findFlights departure,destination

    foundFlights.size.should > 0
  end


end