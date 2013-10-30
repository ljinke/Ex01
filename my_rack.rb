require 'rack'

class HelloWorld 
	def call(env) 
		[200, {'Content-Type' => 'text/plain'}, ['Hello World!']] 
	end 
end

Rack::Handler::WEBrick.run HelloWorld.new, :Port => 9876