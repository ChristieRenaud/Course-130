#inputs: an array as an argument and a block
#outputs: yields each element an index number to the block. returns a reference to the original array.
#approach: 
#start an index at 0
#iterate through the array
#yield to the block, passing in the current value and the index
#increment the index
#return the original array

def each_with_index(array)
  counter = 0
  array.each do |value|
    yield(value, counter)
    counter += 1
  end
end

#example:
result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
