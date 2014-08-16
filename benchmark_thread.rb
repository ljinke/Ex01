require 'benchmark'
require 'mysql2'
 
x = Mysql2::Client.new
y = Mysql2::Client.new
 
Benchmark.bm do |b|
  b.report('w/o') do
    x.query("SELECT SLEEP(1)")
    y.query("SELECT SLEEP(1)")
  end
 
  b.report('with') do
    a = Thread.new{ x.query("SELECT SLEEP(1)") }
    b = Thread.new{ y.query("SELECT SLEEP(1)") }
    a.join
    b.join
  end
end
 
Benchmark.bm do |x|
  x.report('w/o') do
    10_000_000.times{ 2+2 }
  end
  x.report('with') do
    a = Thread.new{ 5_000_000.times{ 2+2 } }
    b = Thread.new{ 5_000_000.times{ 2+2 } }
    a.join
    b.join
  end
end
 
Benchmark.bm do |x|
  x.report('w/o') do
    2.times{ sleep(1) }
  end
 
  x.report('with') do
    a = Thread.new{ sleep(1) }
    b = Thread.new{ sleep(1) }
    a.join
    b.join
  end
end