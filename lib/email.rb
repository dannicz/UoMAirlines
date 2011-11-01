require 'net/smtp'

class Send_email

  def send_email(to, to_alias, message)
	  msg = <<END_OF_MESSAGE
    From: #{"Booking System"} <#{"booking@UoMAirlines.com"}>
    To: #{to_alias} <#{to}>

    #{message}
END_OF_MESSAGE

    Net::SMTP.start('smtp.cs.man.ac.uk', 25) do |smtp|
      smtp.open_message_stream("razisg@cs.manchester.ac.uk", [to]) do |f|
        #Do NOT change these lines#
        f.puts "From: razisg@cs.manchester.ac.uk"
        f.puts "To: "+to
        f.puts "Subject: UoM Ticket Information"
        f.puts
        f.puts msg
     end
    end

  end

end