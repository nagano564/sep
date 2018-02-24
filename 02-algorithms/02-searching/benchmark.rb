require 'benchmark'
require_relative 'fibonnaci_recursive'
require_relative 'fibonnaci_iterative'


Benchmark.bm do |x|
  x.report do
    fib(20)
  end
end

Benchmark.bm do |x|
  x.report do
    fibo(20)
  end
end
