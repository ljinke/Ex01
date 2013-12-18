class VariableClass
	@@c = 9 # class variables
	@d = 0 #Class Level Instance Variables
	def initialize
		@i = 1
	end
	def f1
		@a = 1 #instance variables
	end
	def f2
		@b = 2
	end
	def f3
		@c = 3
	end

	def f4 
		#@d = @d + 1 # this will throw error as @d as instance varialble is not defined/initialized so it's nil, nil has not '+'' method.
	end
end

a = VariableClass.new
p a.instance_variables #=>[]

a.f1
p a.instance_variables #=>[:@a]

a.f2
p a.instance_variables #=>[:@a,:@b]

a.f3
p a.instance_variables #=>[:@a, :@b, :@c]

b = VariableClass.new
b.f1
p b.instance_variables #=>[:@a]

# variable will not be add to instance/object until it's used/called.
# instances/objects of the same type/class may have different variable

p VariableClass.instance_variables

