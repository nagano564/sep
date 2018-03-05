require 'benchmark'

def insertion_sort(collection)
  sorted = [collection.delete_at(0)]

  collection.each do |value|
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
  sorted
end

array = [248, 185, 22, 288, 128, 234, 24, 206, 220]
puts insertion_sort(array).inspect
