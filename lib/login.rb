   require "../lib/csv_reader"

class LogIn

    def check_credentials username, password

     csv = CSVReader.new()
     cust_arr = csv.all_users
     customer_details = nil

     if(username == nil)
       puts "------- username cannot be empty --------"
       return nil
     end
     if(password == nil)
       puts "------- password cannot be empty --------"
       return nil
     end

     cust_arr.each do |customer|
           if(customer.email == username && customer.password == password)
               customer_details = customer
               break
            end
     end

      customer_details
   end

end
