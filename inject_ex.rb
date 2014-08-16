p workds = %w(My name is Jackie.)

p workds.inject(0) {|total, w| total += w.length}

