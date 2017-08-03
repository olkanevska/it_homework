#3. There is a string. Find a maximal number (not a digit) in it

a = '000001jkh999999asdf23kjhw34453kjhkjhk99383773'
b= a.split /[^0-9]/
b.map{ |e| e.to_i}.max