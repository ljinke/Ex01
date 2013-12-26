class C
	def public_method
		p self
		#self.private_method#error:private methods can only be invoked by explicit invoker
		private_method
	end

	private
	def private_method
		p self
	end
end

C.new.public_method