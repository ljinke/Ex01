class A
	def get_name
		puts 'A'
	end
end

class ADecorator
	def initialize(decoratee)
		@decoratee = decoratee
	end
	def method_missing(name,*args, &block)
		@decoratee.send(name,*args,&block)
	end
	def respond_to_missing(name)
		@decoratee.respond_to(name,include_private = true) || super
	end
end

if __FILE__ == $0
	a = A.new()
	d = ADecorator.new(a)
	d.get_name
end