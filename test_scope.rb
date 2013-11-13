def A
	puts 'test'
end

class MyClass
	p 'hello'
	def b
		puts self
	end
	def is_true?
		false
	end
end

my = MyClass.new
p my.is_true?



