class Fibonacci
	def recrusion_cal(n)
		#p "fib(#{n})"
		if n<2
			n
		else
			recrusion_cal(n-1) + recrusion_cal(n-2)
		end
	end
	def dynamic_programming_cal(n)
		cache = Array.new(n + 1, -1)
		inner_dynam_programming_cal(n, cache)
	end
	private
		def inner_dynam_programming_cal(n, cache)

			if  cache[n] < 0
				#p "fib(#{n})"
				if n < 2
					cache[n] = n
				else
					cache[n] = inner_dynam_programming_cal(n-1, cache) + inner_dynam_programming_cal(n-2,cache)
				end
			end
			cache[n]	
		end
end

if __FILE__ == $0
	fib = Fibonacci.new
	p fib.recrusion_cal(50)

	#p fib.dynamic_programming_cal(50)
end