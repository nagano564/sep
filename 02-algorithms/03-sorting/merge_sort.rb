require 'benchmark'

def merge_sort(collection)
  # #1
  if collection.length <= 1
    collection
  else
    # #2
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    # #3
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    # #4
    right
  elsif right.empty?
    # #5
    left
  elsif left.first < right.first
    # #6
    [left.first] + merge(left[1..left.length], right)
  else
    # #7
    [right.first] + merge(left, right[1..right.length])
  end
end

array = [248, 185, 22, 288, 128, 234, 24, 206, 220, 25, 101, 91, 107, 50, 130, 229, 124, 249, 274, 92, 155, 186, 236, 32, 88, 86, 84, 273, 183, 213, 11, 232, 190, 108, 176, 167, 35, 241, 71, 16, 228, 194, 165, 179, 56, 264, 154, 191, 272, 64]

puts Benchmark.measure {merge_sort(array)}
