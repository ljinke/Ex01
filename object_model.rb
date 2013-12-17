#create a anonymous class
c = Class.new(Array) do
	def my_method
		p 'my method'
	end
end

MyClass = c # tricky here, the const name will be the name of the anonymous class name

o = MyClass.new

o.my_method

#instance/object has only .class
p o.class #=>MyClass

#Class has both .class and .superclass
p MyClass.superclass#=>Array
p MyClass.class #=>Class

#method lookup
module M
end
class MyClass2 < Array
	include M
end
#receiver and ancestors
p MyClass2.ancestors #=>[MyClass2, M, Array, Enumerable, Object, Kernel, BasicObject]
#for module, Ruby will create a class called 'include class' or 'proxy class'
# 1. on top of the class including the module but under his parent class.
# 2. invisible to .superclass