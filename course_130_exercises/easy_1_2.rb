def compute(value)
  if block_given?
    yield(value)
  else
    value
  end
end


p compute(6) { |num| num + 3 } #== 9
p compute('k') { |letter| letter + 'b' }# == 'kb'
p compute(3) #== 3