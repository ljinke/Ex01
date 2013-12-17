#class_eval is to open a calss and update the defination
Array.class_eval do 
	def to_i_id
		9999
	end
end

a = []
p a.to_i_id

#instance_eval on class: Class is also object in ruby
Array.instance_eval do
	def to_c_id
		'o9999'
	end
end

p Array.to_c_id

#instance_eval on instance
a.instance_eval do
	def to_s_id
		'm9999'
	end
end

p a.to_s_id


p "instance singleton methods:"
p a.singleton_methods
p "Array\'s all methods:"
p a.methods.grep(/to_\w_id/)
p "Array Class methods:"
p Array.methods.grep(/to_\w_id/)
p 'Array\'s instance methods'
p Array.instance_methods.grep(/to_\w_id/)
