require_relative 'node'

class OpenAddressing

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    my_index = index(key, @items.size)

    #if nothing in index insert
    if @items[my_index] == nil
      @items[my_index] = Node.new(key,value)
    elsif
      find_another_index = next_open_index(my_index)
      if find_another_index == -1
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
    array_for_resize = Array.new( size * 2 )

    (0...@items.length).each do |i|
      if @items[i]
        temp_index_for_resize = @items[i].key.sum % array_for_resize.length
        array_for_resize[temp_index_for_resize] = @items[i]
      end
    end
    @items = array_for_resize
  end
end
