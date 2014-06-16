require 'benchmark'

s = 'A quick test of Ruby performance vs. C#; Author: Marc Clifton; Updated: 8 Nov 2012; Section: Algorithms & Recipes; Chapter: General Programming; Updated: 8 Nov 2012'
s_same_length = 'A quick test of Ruby performance vs. C#; Author: Marc Clifton; Updated: 8 Nov 2012; Section: Algorithms & Recipes; Chapter: General Programming; Updated: 8 Nov 2013'
s_not_same_length = 'A quick test of Ruby performance vs. C#; Author: Marc Clifton; Updated: 8 Nov 2012; Section: Algorithms & Recipes; Chapter: General Programming; Updated: 8 Nov 201'

n = 50_000_000

Benchmark.bm do |x|
	x.report('same length') { n.times { s == s_same_length } }
	x.report('same length <=>') { n.times { s <=> s_same_length } }
	x.report('diff length') { n.times { s == s_not_same_length } }
	x.report('diff length <=>') { n.times { s <=> s_not_same_length } }
end
