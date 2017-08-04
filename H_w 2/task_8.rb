=begin 8. There is a hash where keys and values are strings.
Modify it: all keys should be symbols and all values should be integers.
If you couldn't modify some value set it to nil
=end
hash = {'Dima'=>'30', 'Lena'=>'31'}
hash.each do |v,k|
  hash = v.to_sym,k.to_i
end
puts hash