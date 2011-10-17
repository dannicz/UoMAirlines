  require "../lib/search"

 puts 'Welcome to UoM Airline'
 puts 'please choose (1) to Log In or (2) to Register '

 key=STDIN.gets.chomp

 case key
   when '1'
      puts 'Please Enter your Email Address'
    email=STDIN.gets.chomp
     puts 'Please Enter your PassWord'
    passWord=STDIN.gets.chomp

     search(email,passWord)

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
    customer=Customer.new(f_name,s_name,password,email,address,"client")
     break
   else
     puts 'invalid entry, try again...'

 end

