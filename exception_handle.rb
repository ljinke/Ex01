class RetryException < RuntimeError 
	attr :okToRetry 
	def initialize(okToRetry) 
		@okToRetry = okToRetry 
	end 
end

begin 
	raise 'hello'

rescue SyntaxError, NameError => boom 
	p "String doesn't compile: "
rescue StandardError => bang 
	p "Error running script:"
rescue RuntimeError
	p 'Genral error'
ensure
	p 'process anyway'
end