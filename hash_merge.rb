hash1 = {}
hash2 = {version: nil, included: false}
hash3 = {version: 0, included: nil}

to_merge1 = {version: 0, included: false}
to_merge2 = {version: 0, included: true}


p hash1.merge to_merge1

p hash2.merge to_merge1

p hash3.merge to_merge1

p hash1.merge to_merge2

p hash2.merge to_merge2

p hash3.merge to_merge2

p `grep -c processor /proc/cpuinfo`.to_i
