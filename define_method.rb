if __FILE__ == $0

	class A
	  define_singleton_method :loudly do |message|
	    puts message.upcase
	  end

	  define_method :tell_you do |name|
	          puts name
	  end
	end

	A.loudly "my message"
	a = A.new
	a.tell_you 'dynamic'


	class B
	  class << self
	    define_method :test do
	      puts 'Hello'
	    end
	  end
	end

	B.test

end