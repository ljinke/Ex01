# ruby code
require 'ostruct'                                                                         
Card = OpenStruct

c = Card.new
c.name = 'yafei lee'
puts c.name

c2 = Card.new
c2.name = 'yafei lee'
puts c2.name
puts c2 == c # true

p c2.class.name