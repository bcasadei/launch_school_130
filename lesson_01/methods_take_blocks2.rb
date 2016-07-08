# method implementation
def say(words)
  yield if block_given?
  puts "> " + words
end

# method invocation
say("hi there") do
  system 'clear'
end
# clears screen first, then outputs "> hi there"
# order of operation: line 8 → line 2 → line 3 → line 9 → line 4 → line 5