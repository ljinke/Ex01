p workds = %w(a b c d this is my first sentense)

p workds.inject(0) {|total, w| total += w.length}

