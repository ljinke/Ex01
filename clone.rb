class A
	attr_accessor :id, :name

	def initialize(id,name)
		@id = id
		@name = name
	end
end

a = A.new(1,"Tom")
b = a.clone
c= a.dup

p a.name
p a.object_id
p b.name
p b.object_id
p c.name
p c.object_id