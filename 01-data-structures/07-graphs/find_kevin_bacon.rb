require_relative 'node'
require_relative 'film_hash'
require 'byebug'

class FindKevinBacon

  def initialize(node)
    @answer = []
    @actor_to_find = node
  end

  def find_kevin_bacon(node_start)
    # byebug
    node_start.film_actor_hash.each do |movie, actors|
      actors.each do |actor_name|
        if @answer.length >= 6
          puts "Here is the #{@answer}"
          # puts "#{node_start} is not within 6 degrees of kevin bacon"
        elsif actor_name == "Kevin Bacon"
          @answer.push(movie)
          puts "You found Kevin Bacon"
        else
          @answer.push(movie) unless @answer.include?(movie)
          find_kevin_bacon(actor_name)
        end
      end
    end
    @answer
  end
end
