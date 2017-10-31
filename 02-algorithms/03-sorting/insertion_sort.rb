require 'benchmark'

def insertion_sort(collection)
  sorted = [collection.delete_at(0)]

  for value in collection
    index = 0
    while index < sorted.length
      if value <= sorted[index]
        sorted.insert(index, value)
        break
      elsif index == sorted.length - 1
        sorted.insert(index + 1, value)
        break
      end
      index += 1
    end
  end

  return sorted
end

array = [248, 185, 22, 288, 128, 234, 24, 206, 220, 25, 101, 91, 107, 50, 130, 229, 124, 249, 274, 92, 155, 186, 236, 32, 88, 86, 84, 273, 183, 213, 11, 232, 190, 108, 176, 167, 35, 241, 71, 16, 228, 194, 165, 179, 56, 264, 154, 191, 272, 64]

puts Benchmark.measure {insertion_sort(array)}
