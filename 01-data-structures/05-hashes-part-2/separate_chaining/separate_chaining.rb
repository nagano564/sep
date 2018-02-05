require_relative 'linked_list'


class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @main_answer_array = Array.new(size)
    @cubby = 0.0
  end

  def []=(key, value)
    # computer hash code and assign to single_index
    single_index = index(key, @main_answer_array.size)
    if @main_answer_array[single_index].nil?
      # set @main_answer_array[single_index] to a link that contains key and value
      @main_answer_array[single_index] = LinkedList.new
      @main_answer_array[single_index].add_to_front(Node.new(key,value))
      @cubby += 1.0
    else
      pointer = @main_answer_array[single_index].head
      until pointer == nil || pointer.key == key
        pointer = pointer.next
      end
      if pointer.nil?
        @main_answer_array[single_index].add_to_front(Node.new(key, value))
        @cubby += 1.0
      elsif pointer.key == key && pointer.value != value
        pointer.value = value
      else
        return "item already exists"
      end
    end
    if load_factor() > @max_load_factor
      resize()
    end
    puts "#{show_everything} after insert"
  end

  def [](key)
    key_index = index(key, size())
    if @main_answer_array[key_index]
      pointer = @main_answer_array[key_index].head
      until pointer == nil || pointer.key == key
        pointer = pointer.next
      end
      if pointer.nil?
        return "pair doesnt exist"
      else
        return pointer.value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
     @cubby/(size)
  end

  # Simple method to return the number of items in the hash
  def size
    @main_answer_array.length
  end

  # Resize the hash
  def resize
    temp_resize_hash = @main_answer_array
    temp_resize_array = Array.new( @main_answer_array.size * 2 )
    @main_answer_array.each do |linkedlist|
      if linkedlist != nil
        linkedlist.each do |node|
          new_index = node.key.sum % temp_resize_array.length
          temp_resize_array[new_index] = LinkedList.new
          temp_resize_array[new_index].add_to_front(node)
        end
      end
    end
    @main_answer_array = temp_resize_array
  end

  def show_everything
    everything = ""

  	if @main_answer_array.length == 0
  		#do nothing
  	else
  		@main_answer_array.each_with_index do |linkedlist, index|
  			if linkedlist != nil
  				linkedlist.each do |node|
  					everything = "#{everything}\n#{node.key}:#{node.value} is in slot #{index}"
  				end
  			end
  		end
  	end
    everything
  end
end
