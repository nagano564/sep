require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @cubby = 0.0
  end

  def []=(key, value)
    my_index = index(key, @items.size)

    #if nothing in index insert
    if @items[my_index] == nil
      @items[my_index] = Node.new(key,value)
    elsif
      x = next_open_index(my_index)
      if x == -1
        loop do
          resize()
          new_index = index(key, @items.size)
          break if @items[new_index].nil? || @items[new_index].key == key
        end
        another_new_index = index(key,@items.size)
        if @items[another_new_index].nil?
          @items[another_new_index] = Node.new(key, value)
        else
          @items[another_new_index].value = value
        end
      end
    #if collision my_index = next_open_index then insert
    end
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
    # index is where we start
    # trying to find an empty index after "index"
    loop do
      index += 2
      # break if @items[index] == nil && index > @items.length -1
      if @items[index] == nil
        if index > (@items.length - 1)
          return -1
        else
          break
        end
      end
    end
      return index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  def resize
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
