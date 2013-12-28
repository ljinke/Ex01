#quick sort: select a pivot and partition the data with this pivot, then sort the paritions seperately
def quick_sort(array)
  # return [] if array.empty?
  return array if array.size < 2
  #partition the array with the 1st element of the array: smaller on the left and larger on the right
  left, right = array[1..-1].partition { |y| y <= array.first } 
  quick_sort(left) + [ array.first ] + quick_sort(right)
end

if __FILE__ == $0
	data = [1,2,9,0,19,33,67,81,3,-9,-20,100]

	p quick_sort(data)

end