require 'benchmark'

def selection_sort(collection)
  length = collection.length
  # #1
  for i in 0..length - 2
    # #2
    min_index = i
    # #3
    for j in (i + 1)...length
      if collection[j] < collection[min_index]
        # #4
        min_index = j
      end
    end

    # #5
    tmp = collection[i]
    collection[i] = collection[min_index]
    collection[min_index] = tmp
  end
  collection
end

array = [248, 185, 22, 288, 128, 234, 24, 206, 220, 25, 101, 91, 107, 50, 130, 229, 124, 249, 274, 92, 155, 186, 236, 32, 88, 86, 84, 273, 183, 213, 11, 232, 190, 108, 176, 167, 35, 241, 71, 16, 228, 194, 165, 179, 56, 264, 154, 191, 272, 64]

puts Benchmark.measure {selection_sort(array)}
