require_relative 'linked_list'


class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @cubby = 0.0
  end

  def []=(key, value)
    puts "#{show_everything} before the insert"
    # computer hash code and assign to a_index
    a_index = index(key, @items.size)
    # get @items[a_index] assign to old head
    puts "The value at #{a_index} is #{@items[a_index]} (this should be a linked list)"
    if @items[a_index].nil?
      # set @items[a_index] to a link that contains key and value
      @items[a_index] = LinkedList.new
      @items[a_index].add_to_front(Node.new(key,value))
      @cubby += 1.0
    else
      pointer = @items[a_index].head
      until pointer == nil || pointer.key == key
        pointer = pointer.next
      end
      if pointer.nil?
        @items[a_index].add_to_front(Node.new(key, value))
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
    if @items[key_index]
      pointer = @items[key_index].head
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
    @items.length
  end

  # Resize the hash
  def resize
    a_hash = @items
    b_array = Array.new( @items.size * 2 )
    puts "#{show_everything} is before"
    @items.each do |linkedlist|
      if linkedlist != nil
        linkedlist.each do |node|
          new_index = node.key.sum % b_array.length
          b_array[new_index] = LinkedList.new
          b_array[new_index].add_to_front(node)
        end
      end
    end
    @items = b_array
    puts "#{show_everything}"
  end

  def show_everything
  	if @items.length == 0
  		#do nothing
  	else
  		@items.each do |linkedlist|
  			if linkedlist != nil
  				linkedlist.each do |node|
  					print "\n#{node.value} is in #{linkedlist}"
  				end
  			end
  		end
  	end
  end
end
