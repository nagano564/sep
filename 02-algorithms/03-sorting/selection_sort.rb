
# Selection Sort selects the item which should be sorted "next" and moves it to
# the front (or back) of the collection. Selection sort has poor performance
# compared to other sorting algorithms.

# Best Case: Ω(n^2)
# Worst Case: O(n^2)
# Average Case: Θ(n^2)

require 'benchmark'

def selection_sort(collection)
  length = collection.length

   (0..length - 2).each do |i|
    min_index = i

    ((i + 1)...length).each do |j|
      if collection[j] < collection[min_index]
        min_index = j
      end
    end
    collection[i], collection[min_index] = collection[min_index], collection[i]
  end
  collection
end

array = [248, 185, 22, 288, 128, 234, 24, 206, 220]
puts selection_sort(array).inspect
