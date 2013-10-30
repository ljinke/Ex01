

module Mixin
	def self.included(base)
		base.extend(ClassMethod)
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

end