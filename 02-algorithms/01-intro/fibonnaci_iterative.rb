def fib(n)
  return nil if n.nil?
  i = 1
  fib_0 = 0
  fib_1 = 1

  if n == 0
    return n
  elsif n <= 10
    while i < (n-1) do
      temp = fib_0
      fib_0 = fib_1
      fib_1 = temp + fib_1
      i +=1
    end
    return fib_1
  end
end
