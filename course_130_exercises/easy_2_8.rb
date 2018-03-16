#input: an array and a block
#output: the element for which the block returned the largest value, or nil if array is empty.
#approach:
#iterate through the array yielding each element to the block
#keep track of the largest value and return the element that returns that

def max_by(array)
  largest_item = nil
  array.each do |elem|
    largest_item ||= elem
    largest_item = elem if yield(elem) > yield(largest_item)
  end
  largest_item
end


# examples:
p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil