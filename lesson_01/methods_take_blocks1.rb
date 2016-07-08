# lesson 1 - Writing Methods that take Blocks

def echo(str)
  str
end

def echo_with_yield(str)
  yield if block_given?
  str
end

# without yield
# p echo # wrong number of arguments (0 for 1) (ArgumentError)
# p echo("hello!") # => "hello!"
# p echo("hello", "world!") # => wrong number of arguments (2 for 1) (ArgumentError)

# implicit block withput yield
# p echo { puts "world" } # => wrong number of arguments (0 for 1) (ArgumentError)
# p echo("hello!") { puts "world!" } # => "hello!"
# p echo("hello", "world!") { puts "world" } # => wrong number of arguments (2 for 1) (ArgumentError)

# implicit block with yield
# p echo_with_yield { puts "world" } # => wrong number of arguments (0 for 1) (ArgumentError)
# p echo_with_yield("hello!") { puts "world!" } # outputs: world! # => "hello!"
# p echo_with_yield("hello", "world!") { puts "world" } # => wrong number of arguments (2 for 1) (ArgumentError)

# without conditional `if block_given?`
# p echo_with_yield("hello!") # => `echo_with_yield': no block given (yield) (LocalJumpError)

# with conditional `if block_given?`
p echo_with_yield("hello!") # => "hello!"
p echo_with_yield("hello!") { puts "world!" } # outputs: world! # => "hello!"
