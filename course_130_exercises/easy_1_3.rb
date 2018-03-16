#inputs: a sorted array of integers
#outputs: an array that includes all of the missing integers in order, between the first and last elements of the argument
#approach:
#go from lowest number to highest number in the array, compare each to each element of array,
# if it matches, move to next iteration, if not add to result array.

def missing(array)
  result = []
  (array.first).upto(array.last) do |num|
    result << num if !array.include?(num)
  end
  result
end

#test cases:
p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) #== []
p missing([1, 5]) #== [2, 3, 4]
p missing([6]) #== []

# alternate solution

def missing(array)
  result = []
  array.each_cons(2) do |first, second|   
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

# Enumerable#each_cons iterates through consecutive overlapping sequences. Given the argument n, it takes every
# n consecutive elements from the collection, and iterates through each sequence of n consecutive items. Here it
# sends first and second numbers to the block, then second and third, then third and fourth, etc. Then we find 
# the range of numbers between these two numbers, and concat them to the results array.