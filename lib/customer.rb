

class Customer
       attr_accessor  :us_FirstName,:us_SurName, :us_Password, :us_Email, :us_Address, :us_Type
      def initialize

      end

      def initialize(us_FirstName, us_SurName,us_Password, us_Email, us_Address ,us_Type )
          @us_FirstName=us_FirstName
          @us_SurName=us_SurName
          @us_Address=us_Address
          @us_Email=us_Email
          @us_Password=pass_word(us_Password)
          @us_Type=us_Type
      end

     def pass_word password

        if password.length < 8
             return 'the password should be more than 8 characters'
        else
          @password=password
        end
     end


 end
