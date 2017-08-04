#4. There are two strings. Find number of first chars from first string matching first chars of the second string. Consider two cases: strings are definitely different strings can completely match
print 'Write the first string for comparison and press Enter:'
a = gets.to_s
print 'Write the second string for comparison and press Enter:'
b = gets.to_s
a_arr=a.split('')
b_arr=b.split('')
i = 0
a_arr.each_with_index do | item, index |
  if item == b_arr[index]
    i+=1
  else
    break
  end
end
puts "#{i} - its number of first chars from first string matching first chars of the second string"

