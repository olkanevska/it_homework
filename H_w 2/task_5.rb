#5. There is an array of integers. First puts elements with even indexes and then with odd indexes

arr = [0,1,2,3,4,5,6,7,8,9,10]

puts " This elements with even indexes:"

arr.each_with_index do | item,index |
  if index %2 == 0
    puts item
  end
end

puts " This elements with odd indexes:"

arr.each_with_index do | item,index |
  unless index %2 == 0
    puts item
  end
end
