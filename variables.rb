class VariableClass
	def f1
		@a = 1
	end
	def f2
		@b = 2
	end
	def f3
		@c = 3
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