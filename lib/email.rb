require 'net/smtp'

class Send_email

  def send_email(to, to_alias, message)
	  msg = <<END_OF_MESSAGE
    From: #{"Admin"} <#{"razisg@cs.manchester.ac.uk"}>
    To: #{to_alias} <#{to}>

    #{message}
END_OF_MESSAGE

    Net::SMTP.start('smtp.cs.man.ac.uk', 25) do |smtp|
      smtp.open_message_stream("razisg@cs.manchester.ac.uk", [to]) do |f|
        #Do NOT change these lines#
        f.puts "From: razisg@cs.manchester.ac.uk"
        f.puts "To: "+to
        f.puts "Subject: Ticket is Booked"
        f.puts
        f.puts msg
     end
    end

  end

end

send=Send_email.new
send.send_email("s_aljameel@yahoo.com","User's First Name","Ticket successfully booked!")