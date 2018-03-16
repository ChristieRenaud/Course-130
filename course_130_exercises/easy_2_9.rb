#input: an array and a block
#output: yields each consecutive pair of elements to the block and return nil
#approach:
# initialize a counter
# iterate through array size - 1 times. yield element at index counter and counter + 1 to block
# return nil

def each_cons(array)
  iterations = array.size - 1
  iterations.times do |index| 
    yield(array[index], array[index + 1])
  end
  nil
end

#examples:
hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}