# Bubble Sort passes through a collection multiple times. In each pass, it
# compares adjacent items and swaps them according to the desired sorting order.
# The algorithm finishes when there are no swaps done for a complete pass.
# Bubble sort has poor performance when compared to other sorting algorithms.

# Worst Case: O(n^2)
# Average Case: Θ(n^2)

require 'benchmark'
require 'byebug'

def bubble_sort(collection)
  x = collection.length
  # #1
  begin
    swapped = false
    # #2
    (x - 1).times do |k|
      # #3

      if collection[k] > collection[k + 1]
        collection[k], collection[k + 1] = collection[k + 1], collection[k]
        swapped = true
      end
    end
  end until not swapped

  collection
end


# array = [248, 185, 22, 288, 128, 234, 24, 206, 220]
array = [3,1,2,5,6]
puts bubble_sort(array).inspect
