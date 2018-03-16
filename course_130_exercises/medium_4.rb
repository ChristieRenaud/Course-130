birds = %w(raven finch hawk eagle)
def type(array)
  yield(array)
end

# name_birds(birds) { |_, _, *raptors| puts "Raptors: #{raptors.join(', ')}." }
type(birds) { |blackbird, smallbird| puts "blackbird = #{blackbird}, smallbird = #{smallbird}" }
type(birds) { |birds| p birds } # => ["raven", "finch", "hawk", "eagle"]
type(birds) { |_, _, *raptors| p raptors } # => ["hawk", "eagle"]