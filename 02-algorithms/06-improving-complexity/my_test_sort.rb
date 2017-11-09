require 'byebug'

def my_flatten(*array)
  results = Array.new
  array.each do |element|
    # byebug
    if element.class == Array
      my_flatten(element,results)
    else
      results << element
    end
  end
    p "#{results}"
end

x = [3,5,7]
y = [9,20,4]
z = [99,12,3]

my_flatten(x,y,z)
