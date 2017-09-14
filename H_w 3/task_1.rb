1.upto (10) do |a|

  x = rand(0..9)

  if x.even?
    print"#{a}. The number: #{x}, is even, "
  else print"#{a}. The number: #{x}, is odd, "
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
end