require 'byebug'
require 'benchmark'

def quick_sort(array, low, high)
  if array.length <= 1
    array
  else
    if low < high
      x = partition(array, low, high)
      quick_sort(array, low, x - 1 )
      quick_sort(array, x + 1, high)
    end
  end
  return array
end

def partition(array, low, high)
  pivot = array[high]
  index = low

  for i in (low...high)
    if array[i] <= pivot
      # swap i and index
      temp = array[i]
      array[i] = array[index]
      array[index] = temp
      index += 1
    end
  end
  temp = array[index]
  array[index] = array[high]
  array[high] = temp
  return index
end

array = [248, 185, 22, 288, 128, 234, 24, 206, 220, 25, 101, 91, 107, 50, 130, 229, 124, 249, 274, 92, 155, 186, 236, 32, 88, 86, 84, 273, 183, 213, 11, 232, 190, 108, 176, 167, 35, 241, 71, 16, 228, 194, 165, 179, 56, 264, 154, 191, 272, 64]
p quick_sort(array, 0, array.length - 1)
puts Benchmark.measure {quick_sort(array, 0, -1)}
