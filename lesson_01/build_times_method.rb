# method implemetation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number
end

# method invocation
times(5) do |num|
  puts num
end
# outputs:
# 0
# 1
# 2
# 3
# 4
# => 5
