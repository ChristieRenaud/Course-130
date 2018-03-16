#inputs: 2 arrays as arguments
#outputs: a new array made up of 2-element arrays where the first value is from one array, and the
# second value is from the second array, in order. There should be the same numer of subarrays as elements in the
# original arrays
#approach:
# loop through array.size number of times. Add elements at index 0 to a new-subarray, then at index , until
# you've gone through all iterations. Push the subarrays to a new array.

def zip(array1, array2)
  iterations = array1.size
  results = []
  iterations.times do |index|
    results << [array1[index], array2[index]]
  end
  results
end

#example
p zip([1, 2, 3], [4, 5, 6]) #== [[1, 4], [2, 5], [3, 6]]