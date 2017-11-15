class Bacon
  def self.some_method
    "success"
  end


  def find_kevin_bacon(actor)
    # return array of movies to connect kevin bacon
    target_actor = "Kevin Bacon"
    answer_array =[]
    # fails if over 6
    if answer_array.length >= 6 return nil
      # push keys into answer_array
      current_actor = actor

      # Movies.film_actor_hash.each do |key, value|
      #   #  if current_actor & actor in the same value_array
      #       # push key into answer_array
      #     elsif find another key with current_actor as value
      #       loop thru value_array to find kevin_bacon
      #       no kevin_bacon so find movie with array[all] starting at 0
      #       set searching key to new movies
      #       loop thru value_array to find kevin_bacon
      #       no kevin_bacon so find movie with array[all] starting at 0
      #       set searching key to new movies
      #     else no kevin bacon link
      end
  end
end
