#input: 0 or more arguments
#ouput: a number representing the total number of arguments for which the block returns true
#approach 
#create a counter initialized to 0
#iterate through the arguments, incrementing the counter if the block returns true
# return the counter

def count(*arguments)
  total = 0
  arguments.each { |item| total += 1 if yield(item) }
  total
end

#examples:
p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
