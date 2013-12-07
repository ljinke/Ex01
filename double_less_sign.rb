module Base
end

class A
  include Base
  def do_something
    
  end
  def self.included(base)
    p "including #{base}"
  end
  class << self
    def foo
      puts "I am #{self}"
    end
  end
end

A.foo
a = A.new
a.do_something
a.class.foo

#open an object/instantce
#way1
class << a
	def foo1
		p 'i am a'
	end
end

#way2
def a.foo2 
 p 'i am a'
end 

#way 3
a.instance_eval <<EOT
  def foo3
    p "i am a"
  end
EOT

#way4

module Foo
  def foo4
    p "i am a"
  end
end

a.extend(Foo)

a.foo1
a.foo2
a.foo3
a.foo4

#Singleton methods - 
#those attached to a particular object can be called by only one object. 
#When a singleton method is executed, self is refering to the object.
p a.singleton_methods
#p a.methods
p a.singleton_class
p a.class

p A.class_variables
p A.instance_variables