# ruby code
# struct

Card = Struct.new(:name, :addr)#define a class, with explicit name or default name

c = Card.new

c.name = 'yafei lee'

puts c.name

c2 = Card.new

c2.name = 'yafei lee'

puts c2 == c # true

p c.class.name

#======================================================================================

Struct.new("Point", :x, :y) #=>Struct::Point

p1 = Struct::Point.new(10,20)

p p1