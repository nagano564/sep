def bubble(array)
  if array
  x = array.length
  begin
    swapped = false
    (x - 1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end
  end until not swapped
  array
end
