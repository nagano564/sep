require_relative './quick_sort'
require 'benchmark'
# Worst Case: O(n^2)
# Average Case: Θ(n+k)

def bucket_sort(array)
  bucket_size = 5
  min = array.min
  max = array.max
  bucket_count = ((max - min) / bucket_size).floor + 1
  buckets = Array.new(bucket_count) {Array.new}

  array.each do |element|
    buckets[((element - min) / bucket_size)].push(element)
  end

  array.clear
  (0..buckets.length - 1).each do |x|
    quick_sort(buckets[x], 0, buckets[x].length - 1)
    buckets[x].each do |y|
      array.push(y)
    end
  end
  return array
 end

array = [248, 185, 22, 288, 128, 234, 24, 206, 220] 
puts bucket_sort(array).inspect
