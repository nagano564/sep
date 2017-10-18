class Array
  def quicksort(x)
    return [] if empty?
    pivot = delete_at(rand(size))
    left,right = partition(&pivot.method(:>))

    return *left.quicksort, pivot, *right.quicksort
  end
end
