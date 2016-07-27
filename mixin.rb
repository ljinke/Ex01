module Mixin
	def self.included(base)
		p "module #{self} is being included by #{base}"
		base.extend(ClassMethod)#base here is the calss that include module Mixin
								#extend on class, the methods in extended module will become the class methods of extending class.
	end

	def who_am_i
		puts 'Mixin'
	end

	module ClassMethod
		def who_am_i
			puts 'ClassMethod'
		end
	end
end

class A
	include Mixin
end

if __FILE__ == $0

	a = A.new

	a.who_am_i
	A.who_am_i

	p a.methods.count == A.instance_methods.count #instant methods, they are equal if the instance is not opended and  hanged
	p A.methods.count #class methods
end