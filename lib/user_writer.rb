class UserWriter

  def append_user user

  FasterCSV.open("../UoMAirlinesUsersDB.csv", "a") do |csv|
   csv << [user.f_name, user.l_name, user.password , user.email,user.address, user.type]
  end

   end

end

