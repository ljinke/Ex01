#Singleton Class/meta class/eigen class

class Object
   # The hidden singleton lurks behind everyone
   def metaclass; class << self; self; end; end
   def meta_eval &blk; metaclass.instance_eval &blk; end

   # Adds methods to a metaclass
   def meta_def name, &blk
     meta_eval { define_method name, &blk }
   end

   # Defines an instance method within a class
   def class_def name, &blk
     class_eval { define_method name, &blk }
   end
 end
#five ways to create a class method/open a class and add a class method.
class Person
  def self.species
    "Homo Sapien"
  end
end
 
class Person
  class << self
    def species
      "Homo Sapien"
    end
  end
end
 
class << Person
  def species
    "Homo Sapien"
  end
end
#instance_eval called by Class will add a class method.
Person.instance_eval do
  def species
    "Homo Sapien"
  end
end
 
def Person.species
  "Homo Sapien"
end

p Person.new.metaclass