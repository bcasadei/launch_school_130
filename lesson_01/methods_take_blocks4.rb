# method implementation
def test1
  yield(1, 2) # extra block argument is ignored
end

# method invocation
test1 { |num| puts num }
# outputs: 1

# method implementation
def test2
  yield(1)  
end

# method invocation
test2 do |num1, num2|
  puts "#{num1} #{num2}"
end
# outputs: 1