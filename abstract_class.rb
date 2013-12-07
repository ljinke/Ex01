# This class is abstract; it doesn't define hello or name  
# No special syntax is required: any class that invokes methods  
# that are intended for a subclass to implement is abstract  
class AbstractKlass  
  def welcome  
    puts "#{hello} #{name}"  
  end  
end  
  
# A concrete class  
class ConcreteKlass < AbstractKlass  
  def hello; "Hello"; end  
  def name; "Ruby students"; end  
end  
  
ConcreteKlass.new.welcome # Displays "Hello Ruby students"  