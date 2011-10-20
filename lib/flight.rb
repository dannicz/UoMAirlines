class Flight
  attr_accessor :fl_id, :fl_departure,:fl_destination,:fl_departure_time,:fl_arrival_time,:fl_price

  def initialize fl_id, fl_departure,fl_destination,fl_departure_time,fl_arrival_time,fl_price
    @fl_id=fl_id
    @fl_departure = fl_departure
    @fl_destination = fl_destination
    @fl_departure_time =fl_departure_time
    @fl_arrival_time=fl_arrival_time
    @fl_price=fl_price
  end
end