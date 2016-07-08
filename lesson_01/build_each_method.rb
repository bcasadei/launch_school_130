# method implementation
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter]) # yield to the block passing in the array[counter]/array[index]
    counter += 1
  end

  array # returns array parameter
end

# method invocation
each([1, 2, 3, 4, 5]) do |num|
  puts num
end
# outputs
# 1
# 2
# 3
# 4
# 5
# => [1, 2, 3, 4, 5]

each([1, 2, 3, 4, 5]) {|num| "do nothing"}.select{ |num| num.odd? }
# => [1, 3, 5]

