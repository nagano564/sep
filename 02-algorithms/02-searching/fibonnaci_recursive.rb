require 'benchmark'

def fibo(n)
  if (n == 0)
    # #1
    return 0
  elsif (n == 1)
    # #2
    return 1
  else
    # #3
    return fibo(n-1) + fibo(n-2)
  end
end
