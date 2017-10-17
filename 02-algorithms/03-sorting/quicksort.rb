class Array
  def quicksort
    return [] if empty?

    pivot = delete_at(rand(size))
    left, right = partition(&pivot.method(:>))
    return *left.quicksort, pivot, *right.quicksort

  end
end

array = [3, 34, 1, 23, 5, 23]

p array.quicksort
