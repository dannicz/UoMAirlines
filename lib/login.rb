   require "../lib/csv_reader"

class LogIn


    def check_credentials username, password

     csv = CSVReader.new()
     cust_arr = csv.all_customers
         customer_details = nil
     cust_arr.each do |customer|
    login = 0
       if(customer.email == username )
         if(customer.password == password)
           puts "login successful"
           login = 1
           customer_details = customer
           break
         end
       end
     end

     if(login == 0)
       puts "login failed"
       return nil
     end
    else
     return customer_details
    end
end
