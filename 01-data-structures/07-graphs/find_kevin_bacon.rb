require_relative 'node'
require_relative 'film_hash'
require 'byebug'

class FindKevinBacon

  def initialize(node)
    @answer = []
    @actor_to_find = node
  end

  def find_kevin_bacon(node_start)
    node_start.film_actor_hash.each do |movie, actors|
      actors.each do |actor|
        if @answer.length > 6
          puts "#{node_start} is not within 6 degrees of kevin bacon"
        elsif actor.name == "Kevin Bacon"
          @answer.push(movie)
          puts "You found Kevin Bacon. Here's the list #{@answer}"
        else

          @answer.push(movie) unless @answer.include?(movie)
          puts "Here is the list so far #{@answer}"
          find_kevin_bacon(actor)
        end
      end
    end
    @answer
  end
end
