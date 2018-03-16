

# factorial = Enumerator.new do |y|
#   y << 1
#   a = 1
#   loop do
#     y << (1..a).inject(:*)
#     a += 1
#   end
# end

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end



7.times { puts factorial.next }

# factorial.rewind

factorial.each_with_index do |number, index|
  puts number
  break if index == 6
end



p factorial.take(7)