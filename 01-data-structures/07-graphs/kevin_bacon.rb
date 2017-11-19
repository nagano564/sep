class Bacon
  def self.some_method
    "success"
  end

  def find(actor_name)
    answer = Array.new
    current_actor = actor_name
    hash.each do |movie, actors|
      if actors.include? current_actor
        answer << movie
  	else
  		current_actor = ????
      end
    end
    answer
  end

  def find_kevin_bacon(actor)
    # return array of movies to connect kevin bacon
    target_actor = "Kevin Bacon"
    answer =[]
    current_actor = actor

    # fails if over 6
    if answer.length >= 6 return nil
      # push keys into answer_array

    Movies.film_actor_hash.each do |movie, actor|
     if current_actor == actor in the same value_array

      elsif find another key with current_actor as value
        loop thru value_array to find kevin_bacon
        no kevin_bacon so find movie with array[all] starting at 0
        set searching key to new movies
        loop thru value_array to find kevin_bacon
        no kevin_bacon so find movie with array[all] starting at 0
        set searching key to new movies
      else no kevin bacon link
      end
    end
  end
end
# Here is what you would do if you wanted to write using BFS. 1. Make the movies into a graph.
# 2. Have a queue of `nodes_to_visit` and a set `visited`. 3. Set `current_actor= "kevin bacon"`.
# 4. Push every direct connection of `current_actor` into `nodes_to_visit` and add `current_actor`
# to `visited`.  5. If `nodes_to_visit` is empty or `visited` size equals the number of actors,
# it cannot be found. 6. Pop `nodes_to_visit` and set `current_actor` to this value.
# 7. If `current_actor` exists in `visited` then skip and repeat previous step. 8. Otherwise, repeat step 4.
