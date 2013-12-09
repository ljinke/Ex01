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
rescue RuntimeError
	p 'Genral error'
rescue StandardError => bang 
	p "Error running script:"
else
	p 'other eror'
ensure
	p 'process anyway'
end