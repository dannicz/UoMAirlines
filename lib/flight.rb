class Flight
  attr_accessor :fl_id, :fl_departure,:fl_destination,:fl_departure_time,:fl_arrival_time,:fl_price

  def initialize  *args
    case args.size
      when 6:
       build args[0],args[1],args[2],args[3],args[4],args[5]
      when 0:
      else
         puts 'This method takes either 0 or 6 arguments'
    end
  end


  def build fl_id, fl_departure,fl_destination,fl_departure_time,fl_arrival_time,fl_price
    @fl_id=fl_id
    @fl_departure = fl_departure
    @fl_destination = fl_destination
    @fl_departure_time =fl_departure_time
    @fl_arrival_time=fl_arrival_time
    @fl_price=fl_price
  end
end