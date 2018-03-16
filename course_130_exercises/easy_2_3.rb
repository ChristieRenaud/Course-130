#inputs: an array
#outputs: an array with same number of elements as the argument passed in. Each element is the result
# of running the block for each element
#approach:
#create a results array
#iterate through the array, each time saving the return value of yielding to the block with the array
# element as an argument
# return the results array

def map(array)
  array.each_with_object([]) { |element, results| results << yield(element) }
#  results
end

#example:
p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]