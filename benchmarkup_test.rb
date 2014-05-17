require 'benchmark'
#performance comparing between array and hash in item looking up
Document = Struct.new(:id,:a,:b,:c)
documents_a = []
documents_h = {}
#10000 items repository
1.upto(100_000) do |n|
  d = Document.new(n)
  documents_a << d
  documents_h[d.id] = d
end
#search 1000 items
searchlist = Array.new(10000){ rand(100_000)+1 }

Benchmark.bm(10) do |x|
  x.report('array'){searchlist.each{|el| documents_a.any?{|d| d.id == el}} }
  x.report('hash'){searchlist.each{|el| documents_h.has_key?(el)} }
end
