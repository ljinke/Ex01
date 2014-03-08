require 'json'

class Email
	attr_accessor :from, :to
end

if __FILE__ == $0
	email = <<-EOS
{
  "class": "Email",
  "vars": {
    "to": "foo@example.com",
    "from": "steve@example.com"
  }
}
	EOS
	json = JSON.parse email
	job = Object.const_get(json["class"]).new
	json["vars"].each {|k, v| job.instance_variable_set("@#{k}", v) }
	
	p job.from
	p job.to

	email2 = Email.new
	['from','to'].each do |attr|
		v = job.instance_variable_get("@#{attr}")
		email2.instance_variable_set("@#{attr}",v)
	end

	p email2.from
	p email2.to
end