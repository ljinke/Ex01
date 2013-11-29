#w:weight list
#v:
def A(w, v, i,j)
  if i == 0 or j == 0
  	0
	end
  if w[i-1] > j
    A(w, v, i-1, j)
  else
   	max(A(w,v, i-1, j), v[i-1] + A(w,v, i-1, j - w[i-1]))
  end
end


