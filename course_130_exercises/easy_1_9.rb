#input: an array
#output: true if the block returns true for exactly one of the elements of the array.
# returns false if block returns false for all elements, if the block returns true for 2 elements, 
# returns false and stops iterating.

def one?(array)
  counter = 0
  array.each do |element| 
    counter += 1 if yield(element)
    return false if counter == 2
  end
  counter == 0 ? false : true
end

#examples:
p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false