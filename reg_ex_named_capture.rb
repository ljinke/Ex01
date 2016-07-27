#!/usr/bin/env ruby19  
users = %w{   
  alice:10.23.52.112:true   
  bob:192.168.10.34:false 
}  

user_regexp = %r{   (?<username> [a-z]+ ){0}    (?<ip_number> [0-9]{1,3} ){0}   (?<ip_address> (\g<ip_number>\.){3}\g<ip_number> ){0}    (?<admin> true | false ){0}    \g<username>:\g<ip_address>:\g<admin> }x  
users.each do|u|   
  r = user_regexp.match(u)   
  puts "User #{r[:username]} is from #{r[:ip_address]}" 
end