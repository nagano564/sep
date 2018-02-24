require_relative './quick_sort'
require 'benchmark'

  def bucket_sort(array)
     bucket_size = 5

     min = array.min
     max = array.max

     bucket_count = ((max - min) / bucket_size).floor + 1
     buckets = Array.new(bucket_count) {Array.new}
     #array into buckets
     array.each do |element|
       buckets[((element - min) / bucket_size)].push(element)
     end

    array.clear
    (0..buckets.length - 1).each do |x|
      quick_sort(buckets[x], 0, buckets[x].length - 1)
      # p "#{sorted}"
      buckets[x].each do |y|
        array.push(y)
      end
    end
    return array
   end

   array = [248, 185, 22, 288, 128, 234, 24, 206, 220, 25, 101, 91, 107, 50, 130, 229, 124, 249, 274, 92, 155, 186, 236, 32, 88, 86, 84, 273, 183, 213, 11, 232, 190, 108, 176, 167, 35, 241, 71, 16, 228, 194, 165, 179, 56, 264, 154, 191, 272, 64]

   puts Benchmark.measure {bucket_sort(array)}
