class A
	def self.hello
		p "A"
	end
	def hello
		p "a"
	end
end

if __FILE__ == $0
	a = Object.const_get "A"
	a.hello
	a.new.hello
end