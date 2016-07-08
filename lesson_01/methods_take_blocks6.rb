# method implementation
def time_it
  time_before = Time.now
  yield
  time_after = Time.now

  puts "It took #{time_after - time_before} seconds"
end

# method invocation
time_it { sleep(3) }
# outputs: It took 3.005295 seconds

time_it { "hello world" }
# outputs: It took 2.0e-06 seconds

# There are many useful use cases for "sandwich code". 
# Timing, logging, notification systems are all 
# examples where before/after actions are important.

# Summary

# blocks are one way that Ruby implements closures. Closures are a way to pass 
# around an unnamed "chunk of code" to be executed later.

# blocks can take arguments, just like normal methods. But unlike normal methods, 
# it won't complain about wrong number of arguments passed to it.

# blocks return a value, just like normal methods.

# blocks are a way to defer some implementation decisions to method invocation time. 
# It allows method callers to refine a method at invocation time for a specific use case. 
# It allows method implementors to build generic methods that can be used in a variety 
# of ways.

# blocks are a good use case for "sandwich code" scenarios, 
# like closing a File automatically.