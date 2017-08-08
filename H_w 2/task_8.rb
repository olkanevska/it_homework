#8. There is a hash where keys and values are strings. Modify it: all keys should be symbols and all values should be integers. If you couldn't modify some value set it to nil

hash = {'Dima'=>'30', 'Lena'=>'31'}

hash = Hash[ hash.map { |k, v| [k.to_sym, v.to_i] } ]

puts hash