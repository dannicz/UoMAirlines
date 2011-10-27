require "../lib/login"
require "../lib/registration"
require "../lib/user"
require "../lib/search_flights"
require "../lib/search_email"


class UserInterface

  def initialize
    @@user_name = nil
  end

  def self.user_name
    @@user_name
  end

  def login

  if(@@user_name == nil)
    user = nil
           while user == nil
             user = prompt
              if user != nil
                puts 'Welcome '+user.f_name
                puts 'Happy to see you again !'
                puts ''
              else
                 puts 'Oops! Invalid credentials...'
                puts ''
              end
           end
      @@user_name = user.email
  else
    puts 'You are already logged in...'
  end

  puts 'Press any key to continue...'
  key = STDIN.gets.chomp
  execute_user_interface
end

  def enter_email

   email = nil
   valid = false
   not_unique = true

   puts 'Enter your Email Address'
    while !validate_email email
      if valid
          puts 'Please enter a valid email'
        end
       email=STDIN.gets.chomp
       valid = true
    end

   while !check_unique_email(email)
     if not_unique
        puts 'This email already exists'
     end
      email = enter_email()
      not_unique=false
   end

   @@user_name = email
   email

 end

  def enter_password
     password = nil
    error = false

     puts 'Enter your PassWord : '
     while ! validate_password password
        if error
           puts 'Please Enter a valid PassWord : '
         end
        password = gets.chomp
        error = true
     end

    password
  end

  def register
     if(@@user_name == nil)
      puts 'Enter your First Name: '
      f_name=gets.chomp
      puts 'Enter your Sur name : '
      s_name=gets.chomp
      email = enter_email()
      password = enter_password()
      puts 'Enter your Address : '
      address = gets.chomp

      save_record f_name, s_name, password, email, address

      key = STDIN.gets.chomp
      execute_user_interface

     else
        puts 'You cant register when you are logged in...'
        puts 'Press any key to continue ...'
        key = STDIN.gets.chomp
        execute_user_interface
     end

  end

  def menu

    key = gets.chomp

    case key
       when '1'
             register
       when '2'
             login
       when '3'
             search
       when '4'
             #print_ticket
       when '5'
             logout
      else
        puts 'Invalid option... Please select again'
        menu
    end

  end

  def search

      puts "Please enter the flight details"
      puts
      searcher = SearchFlights.new
      searcher.search_for_flights
      puts 'Press any key to continue...'
      key = STDIN.gets.chomp
      execute_user_interface
end

  def prompt
    puts 'Enter your Email Address : '
    email = gets.chomp

    puts 'Enter your Password : '
    passWord = gets.chomp

    login = LogIn.new()
    user = login.check_credentials(email,passWord)
  return user
end

  def validate_email(email)
    if email!= nil and email.include? "@" and email.include? "."
       return true
        else
        return false
    end
  end

  def check_unique_email (email)
      check_unique = SearchEmails.new
      if check_unique.unique_email(email)
        return false
      else
        return true
      end
  end

  def validate_password password
    if password!= nil and password.length >= 8
      return true
      else

        return false
    end
  end

  def save_record f_name, s_name, password, email, address

       user=User.new(f_name,s_name,password,email,address,"client")
       reg = Registration.new
       reg.add_customer user
       puts 'Your details have been registered successfully !!!'
       puts ''
       puts 'You are automatically logged in...'
       puts 'You may right away search for flights !!!'
       puts 'Press any key to continue...'
end

  def welcome
  puts ''
  puts ''
  puts ' ==============================================='
  puts '|           Welcome to UoM Airlines             |'
  puts ' ==============================================='
  puts '|                                               |'
  puts '|                --- Menu ---                   |'
  puts '|                                               |'
  puts '| [1] Register                                  |'
  puts '| [2] Login                                     |'
  puts '| [3] Search for flights                        |'
  puts '| [4] Print ticket details                      |'
  puts '| [5] Logout                                    |'
  puts '|                                               |'
  puts ' ==============================================='
  puts ' Enter your Option: '
end

  def execute_user_interface
      welcome
      menu
  end

  def logout
              puts ' =================================================='
              puts '|       Thank you for using UoM Airlines           |'
              puts ' =================================================='
              exit
end

end