class UserWriter

  def append_user user

  FasterCSV.open("../UoMAirlinesUsersDB.csv", "a") do |csv|
   csv << [user.f_name, user.l_name, user.address, user.email, user.password, user.type]
  end

   end

end

