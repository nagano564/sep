def poorly_written_ruby(*arrays)
  p "#{arrays.flatten!.sort!}"
end


arrays = [[2,4,1],[3,9,6],[0,8,7]]

poorly_written_ruby(arrays[0], arrays[1], arrays[2])
