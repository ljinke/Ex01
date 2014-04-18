if __FILE__ == $0

# 1. nil check
a||=[]

# 2. symbol to proc
puts [1,2,3].inject(0, &:+)
puts ['a','b','c'].map(&:capitalize)

# 3 named parameter

def f(param)
  param.each {|key, value| puts "#{key} is #{value}" }
end

f(:name=>'Tom',:Id=>9001)

def f4(p1, options={})
  p p1
  p2 = options[:p2] || options["p2"]
  p p2.class.name
  p p2[0]
  p p2[1]
  p p2.join ','
  p "(abc)"
end

f4(1,"p2"=>["'applicationi/pdf'","abc"], :p3=>3)

# f(name:'Tom',Id:9001) Ruby 2.0

def my_method(opts={})
   o = {
     :a => 'Testing',
     :b => 'this',
     :c => 'feature'
   }.merge(opts)
   
   puts "#{o[:a]} #{o[:b]} #{o[:c]}"
 end
 
 my_method
 my_method( :b => 'this great' )

#4 array parameter

def f2(*args)
  args.each{|x| puts x}
end

f2("arg1","arg2","arg3")

#5 default parameter

def f3(x,y=10)
  puts x+y
end

f3(10)
f3(10,10)

#6 self yield

abc={}
abc[:k] = [1,2,3]
p abc[:k]

end

