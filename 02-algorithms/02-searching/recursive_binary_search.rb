def recursive_binary_search (collection, value)
  min = 0
  max = collection.length - 1
  middle = ((min + max)/2)
  if collection[middle] == value
    middle
  elsif collection[middle] < value
    recursive_binary_search(collection[middle+1..max],value)
  else
    recursive_binary_search(collection[min..middle-1],value)
  end
end
