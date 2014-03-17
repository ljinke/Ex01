class Wes
end
y = 1
Wes.class_eval <<-END
     def hello
         puts "#{y}"
         #puts y
     end
END

# at compile time #{y} has passed the value of y to class_eval.
# at runtime, it's actually: puts “#{y}” 已经变成了 puts “1”

w = Wes.new
w.hello