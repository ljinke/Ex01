require 'digest/md5'
require 'benchmark'

n = 10000

Benchmark.bm do |test| 

	test.report('Digest') { n.times { [1,2,3,4,5,6].each {|n| Digest::MD5.hexdigest(n.to_s) }}}
end
