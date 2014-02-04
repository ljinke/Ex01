#quick sort: select a pivot and partition the data with this pivot, then sort the paritions seperately

#simple version:partition into new array
def quick_sort_simple(array)
  # return [] if array.empty?
  return array if array.size < 2
  #partition the array with the 1st element of the array: smaller on the left and larger on the right
  left, right = array[1..-1].partition { |y| y <= array.first } 
  quick_sort_simple(left) + [ array.first ] + quick_sort_simple(right)
end

#in-place version
#swap function
class Array
	def swap!(a,b)
		self[a], self[b] = self[b], self[a]
		self
	end
end
#left is the index of the leftmost element of the subarray
#right is the index of the rightmost element of the subarray (inclusive)
#number of elements in subarray = right-left+1
def partition(array,left,right,pivotIndex)
	pivotValue = array[pivotIndex]
	for index in (left..right)

	end
end
def quick_sort_in_place(array,left,right)
	# If the list has 2 or more items
  if left < right
    # See "#Choice of pivot" section below for possible choices
    pivotIndex = left
    # Get lists of bigger and smaller items and final position of pivot
    pivotNewIndex = partition(array, left, right, pivotIndex)
    # Recursively sort elements smaller than the pivot
    quick_sort_in_place(array, left, pivotNewIndex - 1)
    # Recursively sort elements at least as big as the pivot
    quick_sort_in_place(array, pivotNewIndex + 1, right)
  end
end

if __FILE__ == $0
	data = [1,2,9,0,19,33,67,81,3,-9,-20,100]

	p quick_sort_simple(data)
  #p quick_sort_in_place(data,0,data.length - 1)

  p (1..5).to_a.swap!(0,4)
end