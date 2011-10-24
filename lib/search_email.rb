require 'rubygems'
require 'faster_csv'

class SearchEmails

  def search_for_emails
    load_database("../UoMAirlinesUsersDB.csv")
  end

  def load_database(path_to_csv)
    @us_email= []

    FasterCSV.foreach(path_to_csv, :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |column|
      @us_email << column[3]
    end
  end

  def unique_email (email)

    search_for_emails

    if @us_email.include?(email)
      return true
    end

  end

end