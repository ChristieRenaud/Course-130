#input: array
#output: true if the block returns true for all elements of the array, false if it returns false for any element.
# Stops iterating when block returns false

def all?(collection)
  collection.each { |elem| return false if yield(elem) == false }
  true
end

#examples:
p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true