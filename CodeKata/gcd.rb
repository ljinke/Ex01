def gcd(x,y)
	min = [x,y].min
	min.downto(1) do |i|
		if x % i == 0 && y % i == 0
			return i
		end
	end
end

def gcd_recursive(x, y)
	p "#{x},#{y}"
	y == 0 ? x : gcd_recursive(y, x%y)
end

if __FILE__ == $0
	p gcd_recursive(5,301)
end