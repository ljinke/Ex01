class Animal
  def sleep
    puts "#{self.class} is sleeping"
  end
end

class Dog < Animal
  def make_noise
    "Woof!"
  end
end

class Cat < Animal
  def make_noise
    "Meow!"
  end
end

[Dog, Cat].each do |obj|
  animal = obj.new
  animal.make_noise
  puts animal.sleep
end