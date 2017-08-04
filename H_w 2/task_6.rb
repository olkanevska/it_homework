#6. There is an array of integers (ary). Puts the index of the last element where ary[0]<ary[i]<ary[-1]
arr = [6,7,1,1,1,5,1,11,7,15,10]

arr2=[]
arr.each_with_index do | item,index |
  if item<arr[-1] and item>arr[0]
    arr2 << index
  end
end

puts "Index of the last element where ary[0]<ary[i]<ary[-1]:  #{arr2[-1]}"





