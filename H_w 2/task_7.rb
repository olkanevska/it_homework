# 7. There is an array of integers (ary). Modify it with adding ary[0] (first element of the array) to each even number. Don't do it for first and last elements

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9,10]

y = arr[0]
z = arr[-1]
arr.map! do |x|
  if x.even? && x!= y && x!= z
    x += y
  else x+= 0
  end
end
puts "#{arr}"
