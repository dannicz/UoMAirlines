

class User
       attr_accessor  :f_name, :l_name, :address, :email, :password, :type

      def initialize(f_name, l_name, password, email, address, type)
          @f_name=f_name
          @l_name=l_name
          @address=address
          @email=email
          @type= type
          @password=pass_word(password)
      end

     def pass_word password

        if password.length < 8
             return 'the password should be more than 8 characters'
        else
          @password=password
        end
     end


 end
