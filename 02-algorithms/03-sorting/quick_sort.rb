require 'byebug'
require 'benchmark'

def quick_sort(array, low, high)
  if array.length <= 1
    array
  else
    if low < high
      pivot = partition(array, low, high)
      # low half
      quick_sort(array, low, pivot - 1 )
      # high
      quick_sort(array, pivot + 1, high)
    end
  end
  return array
end

def partition(array, low, high)
  pivot = array[high]
  index = low

  # for i in (low...high)
  (low...high).each do |i|
    if array[i] <= pivot
      temp = array[i]
      array[i] = array[index]
      array[index] = temp
      index += 1
    end
  end
  # swapping array[index] with array[high] to set a new pivot point
  #
  temp = array[index]
  array[index] = array[high]
  array[high] = temp
  return index
end

array = [248, 185, 22, 288, 128, 234, 24, 206, 220, 25, 101, 91]
puts quick_sort(array, 0 , array.length - 1)
puts Benchmark.measure {quick_sort(array, 0, array.length - 1)}
