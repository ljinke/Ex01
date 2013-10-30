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

# f(name:'Tom',Id:9001) Ruby 2.0

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

end

