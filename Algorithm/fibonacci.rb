require 'benchmark'
require 'matrix'

class Fibonacci
	def fib_iterate(n)
		n2, n1 = 0, 1
		for i in (0 ... n-2)
			n2, n1 = n1, n1 + n2
		end
		return n2 + n1
	end

	def recrusion_cal(n)
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

	def fib n
	  m = Matrix[[1,1],[1,0]]
	  (m ** n)[0,0]
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
	Benchmark.bmbm do |tm|
		n = 50
		tm.report('recursive'){ fib.recrusion_cal(n) }
		
		tm.report('iterate') { fib.fib_iterate(n) }

		tm.report('dp') { fib.dynamic_programming_cal(n)}

		tm.report('matrix') { fib.fib(n)}
	end
end