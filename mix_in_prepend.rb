class Foo
  def bar
    'Hello'
  end
end 

module FooExtensions
  def bar
    super + ' World'
  end
end

class Foo
  prepend FooExtensions # the only change to above: prepend instead of include
end

p Foo.new.bar # => 'Hello World'

