def recursive_binary_search (collection, value)
  min = 0
  max = collection.length - 1
  middle = ((min + max)/2)
  if collection.length == 0
    puts "not found"
  elsif collection[middle] == value
    puts "found value"
  elsif collection[middle] < value
    recursive_binary_search(collection[middle+1..max],value)
  else
    recursive_binary_search(collection[min..middle-1],value)
  end
end


collection = [1,3,5,7,9]
recursive_binary_search(collection, 12)
