require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    my_hash = Hash.new
    my_index = index(key, @items.size)

    #if nothing in index insert
    #if key already exists change value
    #if collision my_index = next_open_index then insert
  end

  def [](key)
    current_index = index(key,@items.size)
    @items[current_index].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    index += 1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  def resize
    a_hash = @items
    b_array = Array.new( size * 2 )
    (0...@items.length).each do |i|
      if @items[i]
        tempIndex = @items[i].key.sum % b_array.length
        b_array[tempIndex] = @items[i]
      end
    end
    @items = b_array
  end
end
