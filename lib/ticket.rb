class Ticket
    attr_accessor :ticket_number, :flight, :user, :payment

    def us_email
      user.email
    end

    def fl_id
      flight.fl_id
    end

    def fl_departure
       flight.fl_departure
    end

    def fl_destination
       flight.fl_destination
    end

    def initialize  *args
      case args.size
        when 6:
         create_ticket_6args args[0],args[1],args[2],args[3],args[4],args[5]
        when 3:
         create_ticket_3args args[0],args[1],args[2]
        else
           puts 'This method takes either 3 or 6 arguments'
      end
    end


  def create_ticket_6args ticket_number, us_email,fl_id, fl_departure,fl_destination,payment
    @ticket_number =ticket_number

    @user= User.new
    @user.email =  us_email

    @flight= Flight.new

    @flight.fl_id=fl_id
    @flight.fl_departure = fl_departure
    @flight.fl_destination = fl_destination

    @payment=payment
  end

   def create_ticket_3args ticket_number,flight, user
      @ticket_number =ticket_number
      @user =user
      @flight =flight
   end



end