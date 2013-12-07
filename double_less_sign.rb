class A
  def do_something
  end

  class << self
    def foo
      puts "I am #{self}"
    end
  end
end

A.foo
a = A.new
a.class.foo

#open an object/instantce
class << a
	def foo
		p 'i am a'
	end
end

a.foo = p 'i am a'

a.foo