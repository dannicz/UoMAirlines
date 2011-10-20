require "../lib/login"
require "../lib/registration"
require "../lib/user"

 class UserInterface

def  menu

puts 'Welcome to UoM Airline'
puts 'please choose (1) to Log In or (2) to Register '

 key=STDIN.gets.chomp

 case key
   when '1'
      user = nil

     while user == nil

      user = prompt
       if user != nil
           puts 'Welcome '+user.f_name
      else
       puts 'Please type your credentials again'
      end
      @@user_details = user
    end

   when '2'
      puts 'Enter your First name'
      f_name=STDIN.gets.chomp
      puts 'Enter your Sur name'
      s_name=STDIN.gets.chomp
      puts 'Enter your PassWord'
      password=STDIN.gets.chomp
      puts 'Enter your Email Address'
      email=STDIN.gets.chomp
      puts 'Enter your Address'
      address=STDIN.gets.chomp
    user=User.new(f_name,s_name,password,email,address,"client")
      reg = Registration.new
      reg.add_customer user
      puts 'Customer registered'

   else
     puts 'invalid entry, try again...'

 end
 end

def prompt
  puts 'Please Enter your Email Address'
    email=STDIN.gets.chomp

     puts 'Please Enter your PassWord'
    passWord=STDIN.gets.chomp


    login = LogIn.new()
     user = login.check_credentials(email,passWord)
  return user
end

 end
