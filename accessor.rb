class Accessor
	attr_reader :name

	def set_name(name)
		@name = name
	end

end

a = Accessor.new
a.set_name("tom")
puts a.name