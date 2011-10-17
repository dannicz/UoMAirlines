


 class Registration

     def initialize
     end

     def add_customer(another_customer)
         user_writer = UserWriter.new
       user_writer.append_user another_customer
     end

 end

