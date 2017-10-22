class Bucketsort

  def insertion_sort(array)

    array.each do |i|
      j = i
      while j > 0 and self[j-1] > self[j]
          self[j], self[j-1] = self[j-1], self[j]
          j = j - 1
      end
    end
  end

  def bucket_sort(array)
     bucket_size = 5

     min = array.min
     max = array.max

     bucket_count = ((max - min) / bucket_size).floor + 1
     buckets = Array.new(bucket_count) {Array.new}
     #array into buckets
    (0..array.length - 1).each do |i|
      buckets[((array[i] - max) / bucket_size)].push(array[i])
    end

    array.clear
    (0..buckets.length - 1).each do |x|
      insertion_sort(buckets[x])
      buckets[x].each do |y|
        array.push(y)
      end
    end
     p "#{bucket_count}"
     p "#{buckets}"
     p "#{array}"
   end
end

  bsort = Bucketsort.new
  array = [3, 5, 2, 12 ,7 ,34, 20]
  bsort.bucket_sort(array)
