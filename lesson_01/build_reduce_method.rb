require 'pry'
# method implementation
def reduce(arr, number=0)
  counter = 0
  sum = number
  while counter < arr.size
    current_element = arr[counter]
    sum = yield(sum, current_element)
    counter += 1
  end

  sum
end

array = [1, 2, 3, 4, 5]

# method invocation
p reduce(array) { |acc, num| acc + num } # => 15
p reduce(array, 10) { |acc, num| acc + num } # => 25
# reduce(array) { |acc, num| acc + num if num.odd? } # => NoMethodError: undefined method `+' for nil:NilClass