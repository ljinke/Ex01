class A
	attr_accessor :id
	attr_accessor :name

	def initialize(id,name)
		@id = id
		@name = name
	end
end

if __FILE__ == $0
	data = [A.new(1,"Tom"),A.new(2,"Mike"),A.new(2,"Jason")]
	p data.max_by(&:id).id

	p	data.find_all{ |x| x.id%2 == 0 }.length
end

