#Say there are n paintings with weights w1, ..., wn and market values v1, ..., vn. 
#Define A(i,j) as the maximum value that can be attained from considering only the first i items weighting at most j pounds as follows. 
#w:weight list of goods
#v:maket values of goods
#i:first i items
#j:max weight of the bag
#return: max value for the bag
def A(w, v, i,j)
  if i == 0 || j == 0
  	0
	elsif w[i-1] > j
    A(w, v, i-1, j)
  else
   	[A(w,v, i-1, j), v[i-1] + A(w,v, i-1, j - w[i-1])].max
  end
end

if __FILE__ == $0
	w=[1,2,9,100,90,12,15,19,2,3,35,40,23,8,5] 
	v=[1,3,90,1000,100,100,200,30,91,20,40,350,4000,32000,20]
	memo = Array.new(v.length, Array.new(w.length,0))
	p memo
	p A(w,v,5,200)
end
