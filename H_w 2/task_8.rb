#8. There is a hash where keys and values are strings. Modify it: all keys should be symbols and all values should be integers. If you couldn't modify some value set it to nil
hash = {'Dima'=>'30', 'Lena'=>'31','Igor'=> 'boy','Else'=> '0'}

hash = hash.map{|k,v| [k.to_sym, v]}.to_h
#hash.keys.each {|k| hash[k.to_sym] = hash.delete(k)}

hash.each_pair do |k,v|
  if v == '0'
    hash[k] = 0
  else
    #if v.to_i == 0
    #  hash[k] = nil
    #else
    #  hash[k] = v.to_i
    #end
    hash[k] = (v.to_i == 0) ? nil : v.to_i
  end
end

puts hash
