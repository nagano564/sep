require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    my_item = HashItem.new(key, value)
    a_index = index(key,@items.size)
      if @items[a_index].nil?
        @items[a_index] = my_item
      elsif @items[a_index].value == value && @items[a_index].key == key
        return "do Nothing"
      else
        loop do
        # call resize until space for new element
          resize()
          b_index = index(key, size())
          break if @items[b_index].nil? || @items[b_index].key == key
        end
        c_index = index(key, @items.size)
        if @items[c_index].nil?
          @items[c_index] = my_item
        else
          @items[c_index].value = value
        end
      end
  end
  # my_hash = HashClass.new(5)
  # my_hash["key"] = "value"

  def [](key)
    current_index = index(key,@items.size)
    @items[current_index].value
  end
  # value = my_hash["key"]

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

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
