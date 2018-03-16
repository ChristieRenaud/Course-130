#input: an array
#output: a count of the number of times the block returns true.
#approach:
# set counter to 0
# iterate through collection,incrementing counter every time block returns true
# return counter

def count(collection)
  counter = 0
  collection.each { |element| counter += 1 if yield(element) }
  counter
end

def count(collection)
  results = collection.select { |element| yield(element) }
  results.size
end

#examples:

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2