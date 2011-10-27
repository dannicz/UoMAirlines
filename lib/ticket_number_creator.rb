class TicketNumberCreator
    def search_for_tickets
    load_database("../UoMAirlinesPaymentsDB.csv")
  end

  def load_database(path_to_csv)
    @ticket_numbers= []

    FasterCSV.foreach(path_to_csv, :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |column|
      @ticket_numbers << column[0]
    end
  end

  def unique_ticket_number (number)

    search_for_tickets

    if @ticket_numbers.include?(number)
      return false
    else
      return true
    end

  end

  def create_ticket_number
   random_number = rand(100000)

   while !unique_ticket_number random_number
     random_number = rand(100000)
   end

  random_number
  end
end