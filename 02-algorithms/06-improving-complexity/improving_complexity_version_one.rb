
  def poorly_written_ruby(*arrays)
    combined_array = Array.new
    combined_array = arrays.flatten

    sorted_array = [combined_array.delete_at(combined_array.length-1)]
    p "#{sorted_array}"
    for val in combined_array
      # unneccessary while loop for loop will loop through combined_array
      # i = 0
      # while i < sorted_array.length
      (1..combined_array[-1]).each do |i|
        if val <= sorted_array[i]
          sorted_array.insert(i, val)
          # break unneccessary break
          # changed length-1 to -1
        elsif i == sorted_array[-1]
          sorted_array << val
          # break unneccessary break
        end
        i+=1
      end
    end

    # Return the sorted array
    p "#{sorted_array}"

  end

arrays = [[2,4,1],[3,9,6],[0,8,7]]

poorly_written_ruby(arrays)
