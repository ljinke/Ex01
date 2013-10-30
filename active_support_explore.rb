if __FILE__ == $0

	require 'active_support/core_ext/object/blank'

	class Utility
		def demo
			puts ''.blank?
		end
	end

	if __FILE__ == $0

		u = Utility.new
		u.demo
	end

end
