require 'faster_csv'


class UserWriter

  def append_user user

    FasterCSV.open("../UoMAirlinesUsersDB.csv", "a") do |csv|
      csv << [user.f_name, user.l_name, user.password , user.email,user.address, user.type]
    end

  end

  def create_users_db_unless_exists

    unless File.exists?("../UoMAirlinesUsersDB.csv")
      FasterCSV.open("../UoMAirlinesUsersDB.csv", "w") do |csv|
        csv << ["us_FirstName","us_SurName","us_Password","us_Email","us_Address","us_Type"]
      end
    end

  end

end

