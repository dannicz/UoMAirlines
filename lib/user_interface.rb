require "../lib/login"
require "../lib/registration"
require "../lib/user"
require "../lib/search_flights"
require "../lib/search_email"
require "../lib/ticket_manager"
require "../lib/ticket_cancellation"

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
                puts '-----------------'
                puts "login successful !"
                puts '-----------------'
                puts ''
                puts 'Welcome '+user.f_name
                puts 'Happy to see you again !'
                puts ''
              else
                puts '-----------------'
                 puts " login failed !"
                 puts '-----------------'
                 puts 'Oops! Invalid credentials...'
                puts ''
              end
           end
      @@user_name = user.email
  else
    puts 'You are already logged in...'
  end

  puts "Press 'Enter' to continue..."
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

   while is_email_unique(email)
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
        puts "Press 'Enter' to continue"
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
             print_ticket
       when '5'
             update
       when '6'
             cancel_reservation
       when '7'
             print_my_tickets
       when '8'
             logout
        else
        puts 'Invalid option... Please select again'
        menu
    end

  end

  def cancel_reservation
     if(@@user_name != nil)
       ticket_cancel= TicketCancellation.new
       puts 'Please enter the ticket number to cancel'
       ticket_number=STDIN.gets.chomp
       ticket_cancel.delete_ticket ticket_number
       puts 'Your ticket has been cancelled.An e-mail has been sent for further information.'
     else
        puts 'We are sorry! You need to login/Register to use our services'
        puts ''

     end
      puts "Press 'Enter' to continue..."
      key = STDIN.gets.chomp
     execute_user_interface
  end

  def update
     if(@@user_name != nil)
       manager= TicketManager.new
       manager.update_tickets @@user_name
       search
     else
        puts 'We are sorry! You need to login/Register to use our services'
        puts ''
        puts "Press 'Enter' to continue..."
        key = STDIN.gets.chomp
        execute_user_interface
     end
  end

  def print_my_tickets
      if(@@user_name != nil)
        manager= TicketManager.new
        manager.print_tickets_from_user @@user_name
        puts "Press 'Enter' to continue..."
        key = STDIN.gets.chomp
      else
        puts 'We are sorry! You need to login/Register to see your tickets'
        puts ''
        puts "Press 'Enter' to continue..."
        key = STDIN.gets.chomp
      end
      execute_user_interface
  end

  def print_ticket

    manager= TicketManager.new
    manager.print_ticket_prompt
    puts "Press 'Enter' to continue..."
    key = STDIN.gets.chomp
    execute_user_interface
  end

  def search
      if(@@user_name != nil)
        puts "Please enter the flight details"
        puts
        searcher = SearchFlights.new
        searcher.search_for_flights
        puts "Press 'Enter' to continue..."
        key = STDIN.gets.chomp
        execute_user_interface
      else
        puts 'We are sorry! You need to login/Register to use our services'
        puts ''
        puts "Press 'Enter' to continue..."
        key = STDIN.gets.chomp
        execute_user_interface
      end

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
    email!= nil and email.include? "@" and email.include? "."
  end

  def is_email_unique (email)
      check_unique = SearchEmails.new
       check_unique.unique_email(email)
  end

  def validate_password password
   password!= nil and password.length >= 8
  end

  def save_record f_name, s_name, password, email, address

       user=User.new(f_name,s_name,password,email,address,"client")
       reg = Registration.new
       reg.add_customer user
       puts 'Your details have been registered successfully !!!'
       puts ''
       puts 'You are automatically logged in...'
       puts 'You may right away search for flights !!!'
       puts "Press 'Enter' to continue..."
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
  puts '| [5] Change your flight                        |'
  puts '| [6] Cancel reservation                        |'
  puts '| [7] Print all my tickets                      |'
  puts '| [8] Logout                                    |'
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