require 'rack'

class HelloWorld 
	def call(env) 
		[200, {'Content-Type' => 'text/plain'}, ['Hello World!']] 
	end 
end

if __FILE__ == $0

Rack::Handler::WEBrick.run HelloWorld.new, :Port => 9876

end