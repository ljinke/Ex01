if __FILE == $0

	hash = {"a"=>"a","b"=>"b"}

	hash2 = {a:'a',b:'b'}

	puts hash["a"]

	puts hash2["a"] #=>nil
	#key is defined with symbol, 
	#then only symbol works to get the value
	puts hash2[:a]

end