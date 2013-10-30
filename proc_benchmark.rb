if __FILE__ == $0

require 'benchmark'
 
def outer11(&bl)
  inner1(&bl)
end
 
def outer12(&bl)
  inner2(&bl)
end
 
def outer21
  inner1 {yield}
end
 
def outer22
  inner2 {yield}
end
 
def inner1(&bl)
  bl.call
end
 
def inner2
  yield
end
 
n = 100000
 
Benchmark.bmbm(10) do |rpt|
  rpt.report("outer11") do
    n.times {outer11{}}
  end
 
  rpt.report("outer12") do
    n.times {outer12{}}
  end
 
  rpt.report("outer21") do
    n.times {outer21{}}
  end
 
  rpt.report("outer22") do
    n.times {outer22{}}
  end
end

end