require_relative 'node'

class OpenAddressing
  def initialize(size)
    @answer_array = Array.new(size)
  end

  def []=(key, value)
    first_index = index(key, @answer_array.size)

    #if nothing in index insert
    if @answer_array[first_index] == nil
      @answer_array[first_index] = Node.new(key,value)
    elsif
      index_for_collision = next_open_index(first_index)
      if index_for_collision == -1
        loop do
          resize()
          new_index = index(key, @answer_array.size)
          break if @answer_array[new_index].nil? || @answer_array[new_index].key == key
        end
        index_after_resize = index(key,@answer_array.size)
        if @answer_array[index_after_resize].nil?
          @answer_array[index_after_resize] = Node.new(key, value)
        else
          @answer_array[index_after_resize].value = value
        end
      end
    end
  end

  def [](key)
    index_for_key_to_find = index(key,@answer_array.size)
    @answer_array[index_for_key_to_find].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @answer_array
  def next_open_index(index)
    # index is where we start
    # trying to find an empty index after "index"
    loop do
      index += 2
      # break if @answer_array[index] == nil && index > @answer_array.length -1
      if @answer_array[index] == nil
        if index > (@answer_array.length - 1)
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
    @answer_array.length
  end

  def resize
    temp_resize_array = Array.new( size * 2 )
    (0...@answer_array.length).each do |i|
      if @answer_array[i]
        temp_resize_index = @answer_array[i].key.sum % temp_resize_array.length
        temp_resize_array[temp_resize_index] = @answer_array[i]
      end
    end
    @answer_array = temp_resize_array
  end
end
