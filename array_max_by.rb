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

	p	data.select{ |x| x.id%2 == 0 }.length

	p data.find_all { |x| x.id%2 == 0 }.length
	
	p data.select {|x| x.id%2 == 0}.collect {|x| x.name}

	#p (1..100).select{|x| x ** 2 > 3 }.collect{|x| 2 * x}
	p	data.find_all{ |x| x.id%2 == 0 }.length

  p data.map {|x| x.name}.join

  p data.collect {|x| x.name}.join

  p A.name

  p data[0].class.name
end

