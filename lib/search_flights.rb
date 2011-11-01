require 'rubygems'
require 'faster_csv'
require '../lib/flight'
require '../lib/csv_reader'
require '../lib/payment'
require 'search_flights'
require '../lib/user_interface'

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
      @fl_Departure << column[1].downcase #change here to get the wanted value#
      @fl_Destination << column[2].downcase
      @fl_DepartureTime << column[3].downcase
      @fl_ArrivalTime << column[4].downcase
      @fl_Price << column[5].downcase
    end
  end

  def search_for_departurePlace
    print "Enter Departure Town: "
    departure = gets.chomp
    puts

    if @fl_Departure.include?(departure.downcase)
      print "Enter Destination Town: "
      destination = gets.chomp

      if @fl_Destination.include?(destination.downcase)

        foundFlights =  findFlights departure,destination

        flight = nil
        while flight == nil
            flight = selectDesiredFlight foundFlights
        end
        if(@@old_flight_id != nil)
          if(@@old_flight_price < @fl_price)
            @fl_Price =   @@old_flight_price - @fl_price
            payment = Payment.new
            payment.payment_gateway flight
          else

            end
        else
         payment = Payment.new
         payment.payment_gateway flight
         end

      else
        puts "#{destination} Not found..."
        search_for_departurePlace
      end
    else
      puts "#{departure} Not found..."
      search_for_departurePlace
    end
  end

  def findFlights departure,destination

    csv_reader = CSVReader.new
    flights=csv_reader.all_flights
    foundFlights = []

        flights.each do |flight|
          if(flight.fl_departure.downcase == departure.downcase && flight.fl_destination.downcase == destination.downcase)
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
             end
          end
            if flight==nil
               puts "Incorrect input"
              end
        end

    return flight

  end

end

