class Traveler

  def neartest_possible_neighbor(graph_of_cities, starting_city)
    current_city = starting_city
    answer_array = Array.new

    until graph_of_cities.length == 0

      graph_of_cities.each do |hash|
        if hash[:city] == current_city
          answer_array.push(hash)
        end
      end

      graph_of_cities = graph_of_cities - answer_array
      temp_array = []

      graph_of_cities.each do |hash|
        distance_of_two_cities = Distance.new(
                                     answer_array[-1][:x],
                                     answer_array[-1][:y],
                                     hash[:x],
                                     hash[:y]
                                     ).how_far
        hash[:distance] = distance_of_two_cities
        temp_array.push(hash)
        temp_array.sort!{ |a, b| a[:distance] <=> b[:distance]}
      end

      answer_array.push(temp_array[0])
      graph_of_cities = graph_of_cities - answer_array
      current_city = answer_array[-1][:city]
    end
    answer_array
  end
end
