#class variable vs. class instance variable
class Polygon
  class << self
    attr_accessor :sides
  end
end

class Triangle < Polygon
  @sides = 3
end

class Rectangle < Polygon
  @sides = 4
end

class Square < Rectangle
end

class Hexagon < Polygon
  @sides = 6
end
if __FILE__ == $0
	puts "Triangle.sides:  #{Triangle.sides.inspect}"  # 3
	puts "Rectangle.sides: #{Rectangle.sides.inspect}" # 4
	puts "Square.sides:    #{Square.sides.inspect}"    # nil
	puts "Hexagon.sides:   #{Hexagon.sides.inspect}"   # 6
end

#
class Base
  @@shared = 'cattr from base'
  class << self
    attr_accessor :unshared
  end
  def self.shared
    @@shared
  end
  self.unshared = 'attr from base'
end
class Derived < Base
  @@shared = 'cattr from derived'
  self.unshared = 'attr from derived'
end
class Ouch < Base
  class << self
    attr_accessor :unshared
  end
  def self.shared
    @@shared
  end
end
puts Base.unshared
puts Base.shared
puts Derived.unshared
puts Derived.shared
puts Ouch.unshared
puts Ouch.shared

p RUBY_VERSION