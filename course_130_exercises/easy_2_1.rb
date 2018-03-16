#inputs: 3 arguments: a starting value, ending value, and step value
#outputs: applies the block to each step value. Returns the range of values? an array of the steps? last value?
#approach: go from the starting value up to the ending value. run the block on every nth value.

def step(start_value, end_value, step_value)
  counter = start_value
  loop do
    yield(counter)
    break if counter + step_value > end_value
    counter += step_value
  end
  counter
end
#examples: 
p step(1, 10, 3) { |value| puts "value = #{value}" }  # => 10
# value = 1
# value = 4
# value = 7
# value = 10