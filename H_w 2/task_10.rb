#10. There is a hash where keys are symbols and values are integers. Modify it: leave only pairs where value is natural number and more than 0
hash = {apple: 11, watermelon: 0.5, bannan: -1}
hash.delete_if do |key, value|
  value < 0 or !value.is_a?(Integer)
end
puts hash