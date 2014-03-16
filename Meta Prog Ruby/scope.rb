v1 = 1

class MyClass
	v2 = 2
	p local_variables

	def my_method
		v3 = 3
		p local_variables
	end

	p local_variables
end

obj = MyClass.new
obj.my_method
obj.my_method
p local_variables

#moduel, class and def are scope gate: scope change on every time of the key words.

#===================================================================================================================
#flatening the scope
#Class.new => class
#Module#define_method() => def
#Oject#instance_eval()