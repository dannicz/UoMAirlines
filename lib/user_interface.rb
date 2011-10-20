require "../lib/login"
require "../lib/registration"
require "../lib/user"


class UserInterface


def login
    user = nil

           while user == nil

           user = prompt
           if user != nil
               puts 'Welcome '+user.f_name
          else
           puts 'Please type your credentials again'
          end
        end
end

def register
      puts 'Enter your First name'
      f_name=STDIN.gets.chomp
      puts 'Enter your Sur name'
      s_name=STDIN.gets.chomp
      password
      puts 'Enter your Email Address'
      email=STDIN.gets.chomp
      @@user_name = email
      puts 'Enter your Address'
      address=STDIN.gets.chomp
      pass = save_record f_name, s_name, password, email, address
      if(pass == false)
             password
      end
end

def password
  puts 'Enter your PassWord'
      password=STDIN.gets.chomp
end

def menu

 key=STDIN.gets.chomp
 case key
       when '1'
             login
       when '2'
             register
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

def save_record   f_name, s_name, password, email, address
       if password.length >= 8   and email.include? "@" and email.include? "."

           user=User.new(f_name,s_name,password,email,address,"client")
           reg = Registration.new
           reg.add_customer user
           puts 'Customer registered'
         return true
        else
          puts 'Please select a valid password'
         return false
        end
  end

def welcome
  puts 'Welcome to UoM Airlines'
  puts 'please choose (1) to Log In or (2) to Register '
end

end

ui = UserInterface.new
ui.welcome
ui.menu

