# method implementation
def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

# method invocation
p compare('hello') { |word| word.upcase }

# outputs:
# Before: hello
# After: HELLO
# => nil
# The last expression in the compare method is a puts, 
# and therefore the return value of calling compare 
# is always nil.

p compare('hello') { |word| word.slice(1..2) }
# outputs:
# Before: hello
# After: el
# => nil

p compare('hello') { |word| "nothing to do with anything" }
# outputs
# Before: hello
# After: nothing to do with anything
# => nil

p compare('hello') { |word| puts "hi" } 
# outputs
# hi
# After: 
# => nil
# the puts in the block returns nil, so the puts in the method outputs an empty string.

