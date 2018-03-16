#inputs: an array and a block
#output: an array containing all elemnents of the array, except those at the beginning of the array
# that produce a truthy value when passed to the block

#approach
#start with a copy of the array

#iterate through the array, if the block returns true delete item from copy of the array.
# if the block returns false or nil stop iterating 
# return copy of array

def drop_while(array)
  results = array.dup
  array.each { |item| yield(item) ? results.delete(item) : break }
  results
end



# exercises
p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []