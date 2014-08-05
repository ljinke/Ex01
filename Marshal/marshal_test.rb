class AAAAA
	attr_accessor :v1
	attr_accessor :v2

	def initialize(val1, val2)
		self.v1 = val1
		self.v2 = val2
	end
	def f
		p v1
		p v2
	end
end

if __FILE__ == $0
	a = AAAAA.new(1,2)
	s = Marshal.dump(a) #"\x04\bo:\nAAAAA\a:\b@v1i\x06:\b@v2i\a"
	p s
	a2 = Marshal.load(s)
	a2.f #1,2
end