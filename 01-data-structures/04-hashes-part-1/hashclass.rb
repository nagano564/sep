class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
  end
  # my_hash = HashClass.new(5)
  # my_hash["key"] = "value"

  def [](key)
  end
  # value = my_hash["key"]

  def resize
    #if index == index mulitiply index * 2
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii = key.sum

    ascii
  end

  # Simple method to return the number of items in the hash
  def size
  end

end
