# Bubble Sort passes through a collection multiple times. In each pass, it
# compares adjacent items and swaps them according to the desired sorting order.
# The algorithm finishes when there are no swaps done for a complete pass.
# Bubble sort has poor performance when compared to other sorting algorithms.

# Worst Case: O(n^2)
# Average Case: Θ(n^2)

require 'benchmark'

def bubble_sort(collection)
  n = collection.length
  # #1
  begin
    swapped = false
    # #2
    (n - 1).times do |i|
      # #3
      if collection[i] > collection[i + 1]
        collection[i], collection[i + 1] = collection[i + 1], collection[i]
        swapped = true
      end
    end
  end until not swapped

  collection
end


array = [248, 185, 22, 288, 128, 234, 24, 206, 220]
puts bubble_sort(array).inspect
