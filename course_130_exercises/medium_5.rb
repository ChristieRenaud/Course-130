items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

#1
gather(items) do | *produce, grain |
  puts produce.join(', ')
  puts grain
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

#2
gather(items) do | fruit, *vegetables , grain |
  puts fruit
  puts vegetables.join(', ')
  puts grain
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

#3
gather(items) do | fruit, *other_crops |
  puts fruit
  puts other_crops.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

#4.
gather(items) do | fruit, starch, vegetable, grain |
  puts "#{fruit}, #{starch}, #{vegetable}, and #{grain}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!















