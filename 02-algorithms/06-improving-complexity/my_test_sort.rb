class Array
  def my_flatten(n = nil)
    n ? multiple_flatten(self, n) : recursive_flatten(self)
  end
  private
  def recursive_flatten(array, results = [])
    array.each do |element|
      if element.class == Array
        recursive_flatten(element, results)
      else
        results << element
      end
    end
    results
  end
  def multiple_flatten(array, n)
    count = 0
    arr = array
    while count < n do
      arr = single_flatten(arr)
      count += 1
    end
    arr
  end
  def single_flatten(array)
    results = []
    array.each do |element|
      if element.class == Array
        element.each {|value| results << value}
      else
        results << element
      end
    end
    results
  end

  x = [2,4,1]
  y = [6,3,0]
  z = [9,7,8]
  my_flatten(x,y,z)
  
end
