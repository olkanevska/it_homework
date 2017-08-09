i = 1

while i< 11

  x = rand(0..9)

  if x.even?
    print"#{i}. The number: #{x}, is even, "
  else print"#{i}. The number: #{x}, is odd, "
  end

  if x > 5
    puts 'and is more than 5.'
  elsif x == 5
    puts 'and is 5.'
  elsif x < 5 && x > 0
    puts 'and is less than 5.'
  elsif x == 0
    puts 'and is less than 5. Weve got 0 '
  end
  puts '================'

  i += 1
end