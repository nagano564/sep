
# Merge Sort breaks the collection into sub-collections and sorts each
# sub-collection. Sorted sub-collections are merged together (using recursion) 
# to form larger sorted collections until the entire collection is sorted. Merge
# sort has good performance compared to other sorting algorithms.

# Best Case: Ω(nlgn)
# Worst Case: O(nlgn)
# Average Case: Θ(nlgn

require 'benchmark'
require 'byebug'

def merge_sort(collection)
  # #1
  return collection if collection.length <= 1
    # #2
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    # #3
    merge(left, right)
    # byebug

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

array = [248, 185, 22, 288, 128, 234, 24, 206, 220, 25, 101, 91, 107]
puts merge_sort(array).inspect
