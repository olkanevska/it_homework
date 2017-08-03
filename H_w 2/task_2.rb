#2. There is a string. Find a maximum number of digits placed in a row in it

a = '000001jkh999999asdf23kjhw34453kjhkjhk99383773aaaa00000000000010'

b= a.split /[^0-9]/

puts b.map{ |e| e.size}.max
