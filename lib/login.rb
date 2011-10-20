   require "../lib/csv_reader"

class LogIn


    def check_credentials username, password

     csv = CSVReader.new()
     cust_arr = csv.all_customers
         customer_details = nil
      success = 0
     cust_arr.each do |customer|

           if(customer.email == username )
             if(customer.password == password)
               puts "login successful"
               success = 1
               customer_details = customer
               break
             end
           end
      end
       if(success == 0)
         puts "login failed"
         return nil
       else
        return customer_details
       end
   end

end
