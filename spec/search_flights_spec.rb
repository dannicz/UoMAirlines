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



  #it "should run the command line interface" do

    #searcher = SearchFlights.new
    #searcher.search_for_flights

    #true

  #end


end