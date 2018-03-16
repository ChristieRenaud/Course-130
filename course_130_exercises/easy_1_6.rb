#input: an array
#output: true or false depending on if the block supplied returns true for any of the element values
#requirements: stops iterating once a true value is returned
#returns false if the array is empty


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

#examples:
p any?([1, 3, 5, 6]) { |value| value.even? } #== true
p any?([1, 3, 5, 7]) { |value| value.even? } #== false
p any?([2, 4, 6, 8]) { |value| value.odd? } #== false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } #== true
p any?([1, 3, 5, 7]) { |value| true } #== true
p any?([1, 3, 5, 7]) { |value| false } #== false
p any?([]) { |value| true } #== false