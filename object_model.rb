#create a anonymous class
c = Class.new(Array) do
	def my_method
		p 'my method'
	end
end

MyClass = c # tricky here, the const name will be the name of the anonymous class name

o = MyClass.new

o.my_method