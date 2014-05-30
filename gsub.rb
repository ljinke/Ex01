path = "M 100.12 200.23 L 300.34 400.56 L 200.32 100.23"

r = Regexp.new(/ *([ML]) ([\d\.-]+) ([\d\.-]+)/)

max_x = 0
max_y = 0

path.gsub(r) do|m|
  mx = $2.to_f
  my = $3.to_f
  max_x = mx if mx > max_x
  max_y = my if my > max_y
  "#{$1} #{$2} #{$3} "
end 

p max_x
p max_y