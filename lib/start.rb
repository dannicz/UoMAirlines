
 puts 'Welcome to UoM Airline'
 puts 'please choose (1) to Log In or (2) to Register '

 key=STDIN.gets.chomp

 case key
   when '1'
    puts 'Please Enter your Email Address'
    email=STDIN.gets.chomp
     puts 'Please Enter your PassWord'
    passWord=STDIN.gets.chomp

   when '2'
     puts 'Registration'
     break
   else
     puts 'invalid entry, try again...'

 end

