require 'thread'

def Exception.ignoring_exceptions
  begin
    yield
  rescue Exception => e
    puts e.message
  end
end

module Enumerable
  def in_parallel_n(n)
    todo = Queue.new
    ts = (1..n).map{
      Thread.new{
        while x = todo.deq
          Exception.ignoring_exceptions{ yield(x[0]) } 
        end
      }
    }
    each{|x| todo << [x]}
    n.times{ todo << nil }
    ts.each{|t| t.join}
  end
end

(1..1665).in_parallel_n(10){|i|
  system "wget", "-q", "http://www.sina.com.cn"
}