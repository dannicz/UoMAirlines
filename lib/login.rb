   require "../lib/csv_reader"

class LogIn


    def check_credentials username, password

     csv = CSVReader.new()
     cust_arr = csv.all_users
         customer_details = nil
      success = 0

     if(username == nil)
       puts "------- username cannot be empty --------"
       success = 0
       return nil
     end
     if(password == nil)
       puts "------- password cannot be empty --------"
       success = 0
       return nil
     end

     cust_arr.each do |customer|
           if(customer.email == username )
             if(customer.password == password)
               puts '-----------------'
               puts "login successful !"
               puts '-----------------'
               puts ''
               success = 1
               customer_details = customer
               break
             end
           end
      end
       if(success == 0)
         puts '-----------------'
         puts " login failed !"
         puts '-----------------'
         puts ''
         return nil
       else
        return customer_details
       end
   end

end
