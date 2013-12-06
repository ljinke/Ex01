#Newton's method to calc sqr
def sqr(n)
	raise 'shoudl be number' unless n.is_a?(Fixnum)
	raise 'number should be larger than 0' if n < 0

	t = 0.001 #precision
	r = n / 2;
	while ( ( r - (n/r) ).abs > t ) 
	  r = 0.5 * ( r + (n/r) );
	end
	r
end

if __FILE__ == $0
	p sqr 4
	p sqr 9
	p sqr 2
	p sqr 200

	p sqr '-1'
end