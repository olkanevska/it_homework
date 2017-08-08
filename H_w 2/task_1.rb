#1. Create a method which will take a natural number as an argument and will find a sum of all its digits
 print "Write a natural number and press Enter: "
 a = gets.strip
 
 arr=a.to_s.split''
 arr.map!{ |e| e.to_i}

 sum = arr.inject(0){ |result, elem| result + elem }
 puts "Sum of all argument's digits: #{sum}"
