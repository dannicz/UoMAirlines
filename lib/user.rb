

class User
       attr_accessor  :f_name, :l_name, :address, :email, :password, :type

      def initialize(f_name, l_name, password, email, address, type)
          @f_name=f_name
          @l_name=l_name
          @address=address
          @email=email
          @type= type
          @password=password
      end

 end
