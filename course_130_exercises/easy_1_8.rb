# inputs: an array
# outputs: false if the block returns true for any element, otherwise true. Stops searching the first
# time the block returns true. If any are true, returns false
def any?(array)
  counter = 0
  while counter < array.size
    if yield(array[counter])
      return true
    else
      counter += 1
    end
  end
  false
end

def none?(array, &block)
  return false if any?(array, &block)
  true
end

# examples:
p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
