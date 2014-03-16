my_var = "success"

class MyClass
	#can I access the my_var here??
	begin
		p my_var
	rescue NameError => err
		p err.message
	end
	def my_method
		#can here?
		begin
			p my_var
		rescue NameError => err
			p err.message
		end
	end
end

MyClass.new.my_method

#==================================================
#use Class.new to define class
#use define_method to define instance method

MyClass2 = Class.new do 
	p "#{my_var} in the class defination"
	define_method :my_method do
		p "#{my_var} in the method defination"
	end
end

MyClass2.new.my_method