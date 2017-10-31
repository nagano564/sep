require 'benchmark'

def heap_sort(k)
  # heapify and repeat swap
  n = k.size
  array = [nil] + k
  last_parent = (n / 2)
  # make sure it's in max heap state
  (last_parent).downto(1) do |i|
    down_heap(array, i, n)
  end
  # swap index 1 and last element, last element should go down one after
  # element 1 is in the right place
  while n > 1
    array[1], array[n] = array[n], array[1]
    n -= 1
    down_heap(array, 1, n)
  end
  array.drop(1)
end

def down_heap(array, parent, limit)
  temp = array[parent]
  while (child = 2 * parent) <= limit
    if child < limit && array[child] < array[child + 1]
      child += 1
      break if temp >= array[child]
    end
      array[parent] = array[child]
      parent = child
  end
    array[parent] = temp
end

array = [248, 185, 22, 288, 128, 234, 24, 206, 220, 25, 101, 91, 107, 50, 130, 229, 124, 249, 274, 92, 155, 186, 236, 32, 88, 86, 84, 273, 183, 213, 11, 232, 190, 108, 176, 167, 35, 241, 71, 16, 228, 194, 165, 179, 56, 264, 154, 191, 272, 64]

puts Benchmark.measure {heap_sort(array)}
