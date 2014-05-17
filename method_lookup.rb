module BaseBaseModule
	def method_missing(method, *arguments, &block)
		p  "BaseBaseModule##{method}"
	end
end

class BaseBaseClass
	include BaseBaseModule
	def method_missing(method, *arguments, &block)
		p  "BaseBaseClass##{method}"
		super
	end
end

module BaseModule
	def method_missing(method, *arguments, &block)
		p  "BaseModule##{method}"
		super
	end
end

class BaseClass < BaseBaseClass
	include BaseModule
	def method_missing(method, *arguments, &block)
		p  "BaseClass##{method}"
		super
	end
end



class A < BaseClass
	def method_missing(method, *arguments, &block)
		p  "A##{method}"
		super
	end
end

A.new.hi