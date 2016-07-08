# method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  else
    number + 1
  end
end

# method invocation
p increment(5) do |num|
  puts num
end
# outputs: 6
# order of operations:
# line 11 → line 2 → line 3 → line 4 → line 11 → line 12 → line 13 → line 8

p increment(5) # => 6
