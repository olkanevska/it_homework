# 7. There is an array of integers (ary). Modify it with adding ary[0] (first element of the array) to each even number. Don't do it for first and last elements

arr = [2, 2, 3, 2, 5, 6, 7, 8, 9,10]

a=arr.index(arr[-1])

arr.each_with_index do | item,index |
  if item.even? && index!=0 && index != a
    v = arr[index]+ arr[0]
    arr[index] = v
  end
end
puts "#{arr}"
