require_relative 'node'
require_relative 'film_hash'

class FindKevinBacon

  def initialize(node)
    @answer = []
    @actor_to_find = node
  end

  def find_kevin_bacon(node_start)
    node_start.film_actor_hash.each do |movie, actor|
      actor.each do |actor_name|
        if @answer.length >= 6
          puts "#{node_start} is not within 6 degrees of kevin bacon"
        elsif actor_name == "Kevin Bacon"
          @answer << movie
          puts "You found Kevin Bacon #{answer}"
        else
          @answer << movie
          find_kevin_bacon(actor_name)
        end
      end
    end
  end
  x = FindKevinBacon.new("al_pacino")
  x.find_kevin_bacon("Al Pacino")
end
