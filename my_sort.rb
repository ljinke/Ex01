arr = [5,1,3,9,2,10,0,-1,-2]

def bubble_sort(data)
	for i in 0..(data.length-1)
		min_index = i
		for j in (i + 1)..(data.length-1)
			if data[j] < data[min_index] 
				min_index = j
			end
		end
		swap(data, i, min_index)
	end
	data
end

def swap(data, i, j)
	tmp = data[i]
	data[i] = data[j]	
	data[j] = tmp
end

bubble_sort arr
puts arr.join(",")