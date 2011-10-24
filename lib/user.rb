

class User
       attr_accessor  :f_name, :l_name, :address, :email, :password, :type

      def initialize  *args
        case args.size
          when 6:
           build args[0],args[1],args[2],args[3],args[4],args[5]
          when 0:
          else
             puts 'This method takes either 0 or 6 arguments'
        end

    end

      def build(f_name, l_name, password, email, address, type)
          @f_name=f_name
          @l_name=l_name
          @address=address
          @email=email
          @type= type
          @password=password
      end

 end
