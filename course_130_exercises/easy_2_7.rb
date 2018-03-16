#inputs: an array and an object as an argument, and a block
#output: yields each element and the object to the block, returns the final value of the object.
#approach:
# iterate through the array, yield each element and the object to the block
# return the object

def each_with_object(array, object)
  array.each { |element| yield(element, object) }
  object
end

#examples:
result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}