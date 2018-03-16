#inputs: A positive integer passed into the method as an argument
#outputs: an array of all the divisors of the argument

#approach:
# add 1 and n to array
# starting with 2 and going to n/2, check if n is divisible by each number, if so add to array.
# sort array

# def divisors(n)
#   results = []
#   max = Math.sqrt(n).floor
#   (1..(max)).each do |div|
#       results << div if n % div == 0
#     end
#   results.sort
# end

def divisors(n)
  results = []
  max = Math.sqrt(n).floor
  (1..(max)).each do |div|
    # next if results.include?(div)
    x, y = n.divmod(div)
    results << x << div if y == 0
  end
  results.uniq.sort
end

# test cases:
p divisors(1) #== [1]
p divisors(7) #== [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) #== [1, 2, 7, 14, 49, 98]
p divisors(81)
p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357)

