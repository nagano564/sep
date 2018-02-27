require_relative 'node'
require_relative 'film_hash'
require 'byebug'
require 'pry'

class FindKevinBacon

  def initialize(node)
    @answer = []
    @actor_to_find = node
  end

  def find_kevin_bacon(node_start)
    node_start.film_actor_hash.each do |movie, actors|
      actors.each do |actor|
        if @answer.length > 6
          puts "#{node_start} is not within 6 degrees of Kevin Bacon"
          return
        elsif actor.name == "Kevin Bacon"
          @answer.push(movie)
          puts "You found Kevin Bacon. Here's the list #{@answer}"
        return
        else
          @answer.push(movie) unless @answer.include?(movie)
          find_kevin_bacon(actor)
          return
        end
      end
    end
    puts "No relation to Kevin Bacon"
  end
end
