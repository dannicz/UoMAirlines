require 'rubygems'
require 'faster_csv'
require '../lib/flight'
require '../lib/csv_reader'
require '../lib/payment'
require 'search_flights'

class SearchFlights

  def search_for_flights
    load_database("../UoMAirlinesFlightsDB.csv")
    search_for_departurePlace
  end

  def load_database(path_to_csv)
    @fl_Departure= []
    @fl_Destination = []
    @fl_DepartureTime =[]
    @fl_ArrivalTime =[]
    @fl_Price = []

    FasterCSV.foreach(path_to_csv, :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |column|
      @fl_Departure << column[1] #change here to get the wanted value#
      @fl_Destination << column[2]
      @fl_DepartureTime << column[3]
      @fl_ArrivalTime << column[4]
      @fl_Price << column[5]
    end
  end

  def search_for_departurePlace
    print "Enter Departure Town: "
    departure = gets.chomp
    puts

    if @fl_Departure.include?(departure)
      print "Enter Destination Town: "
      destination = gets.chomp

      if @fl_Destination.include?(destination)

        foundFlights =  findFlights departure,destination

        flight = nil
        while flight == nil
            flight = selectDesiredFlight foundFlights
        end

        Payment.payment_gateway flight

      else
        puts "#{destination} Not found..."
      end
    else
      puts "#{departure} Not found..."
    end
    prompt
  end

  def findFlights departure,destination

    csv_reader = CSVReader.new
    flights=csv_reader.all_flights
    foundFlights = []

        flights.each do |flight|
          if(flight.fl_departure == departure && flight.fl_destination == destination)
            foundFlights.push flight
          end

        end
    return foundFlights
  end

  def selectDesiredFlight foundFlights

        flight = nil

        if foundFlights.size == 0
          puts "No matches found"
        else
          puts "Flight ID | Departure Time | Arrival Time | Price"
          foundFlights.each do |foundFlight|
            puts foundFlight.fl_id + " | "+foundFlight.fl_departure_time+" | "+foundFlight.fl_arrival_time+" | "+foundFlight.fl_price
          end

          puts
          print "Enter ID of Flight: "
          id = gets.chomp

          foundFlights.each do |foundFlight|
             if foundFlight.fl_id == id
               puts "Flight with id "+ id +" selected."
               flight = foundFlight
              else
               puts "Incorrect input"
             end
          end
        end

    return flight

  end

  def prompt
    print "Search again? (y or n) "
    answer = gets.chomp.downcase

    case answer
      when /y/
        search_for_departurePlace
      when /n/
        puts "Goodbye."
        exit
      else
        prompt
    end
  end

end
