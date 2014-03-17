if __FILE__ == $0

	foobar = Array.new

	# 1.
	def foobar.size
	  super.to_s + "Hello World!"
	end

	puts foobar.size  # => "Hello World!"
	puts foobar.class # => Array

	bizbat = Array.new
	puts bizbat.size  # => 0

	# 2
	class << foobar
		def singleton_test
		end
	end

	#3
	foobar.instance_eval do
		self.class.send :define_method, :singleton_test3 do
			p 'test 3'
		end
	end

	#4 
	foobar.instance_eval <<-EOS
		def singleton_test2
			p 'test2'
		end
	EOS

	foobar.singleton_test3

	puts '---------------------------'
	puts foobar.methods
	puts '---------------------------'
	puts foobar.singleton_methods

end