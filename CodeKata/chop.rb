
def chop(target, arry)
	result = -1
	if !(target == nil || arry == nil)
		for i in 0..arry.length
			if target == arry[i]
				result = i
				break
			end
		end
	end
	result
end

def chop_recursive(target, arry)
	result = -1
	if !(target == nil || arry == nil)
		if target == arry.last
			result = arry.length - 1
		else
			result = chop_recursive(target, arry.slice(0, arry.length - 1))
		end
	end
	result
end