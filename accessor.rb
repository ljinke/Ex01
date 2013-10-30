if __FILE__ == $0

class Accessor
	attr_reader :name

	def set_name(name)
		@name = name
	end

end

a = Accessor.new
a.set_name("tom")
puts a.name

end