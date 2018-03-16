#input: an array, an integer representing how many elements to process, and a block
#output: passes specified number of consecutive elements to the block. Returns nil
#approach:
#iterate through the array. cut into a slice with specified number of elements. yield them to the block

def each_cons(array, size)
  iterations = array.size + 1 - size
  iterations.times do |index| 
    yield(*array[index, size])
  end
  nil
end

#or

def each_cons(array, size)
  array.each_index do |index|
    break if index + size - 1 >= array.size
    yield(*array[index, size])
  end
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}