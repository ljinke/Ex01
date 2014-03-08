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
end