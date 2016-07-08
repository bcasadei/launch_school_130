# method implementation
def select(arr)
  counter = 0
  returned_array = []

  while counter < arr.size
    current_element = arr[counter]
    returned_array << current_element if yield(current_element)
    counter += 1
  end

  returned_array
end

array = [1, 2, 3, 4, 5]

# method invocation
select(array) { |num| num.odd? } # => [1, 3, 5]

select(array) { |num| puts num } 
# outputs
# 1
# 2
# 3
# 4
# 5
# => [] because "puts num" returns nil and evaluates to false

p select(array) { |num| num + 1 } 
# => [1, 2, 3, 4, 5] because "num + 1" returns a number and evaluates to true
