#There is a hash where keys are symbols and values are integers. Modify it: remove all pairs where symbols start with "s" character
hash = {dady: 30, mamy: 31, son: 3}

new_hash = Hash[ hash.map { |k, v| [k.to_s,v] } ]

new_hash.delete_if {|k, v| k.to_s.start_with?('s')}

puts new_hash
