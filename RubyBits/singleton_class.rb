if __FILE__ == $0

	foobar = Array.new

	def foobar.size
	  "Hello World!"
	end

	puts foobar.size  # => "Hello World!"
	puts foobar.class # => Array

	bizbat = Array.new
	puts bizbat.size  # => 0

	class << foobar
		def singleton_test
		end
	end

	puts '---------------------------'
	puts foobar.methods
	puts '---------------------------'
	puts foobar.singleton_methods

end