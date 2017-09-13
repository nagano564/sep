require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = Array.new(width) { Array.new(height) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
      matrix[x][y] = pixel
  end

  def at(x, y)
     matrix[x][y]
  end

  private

  def print
    puts "\n\n================="
    puts "["
    @matrix.each do |row|
      puts "  #{row}"
    end
    puts "]"
    puts "=================\n"
  end

  def inbounds(x, y)
    x > 0 ? x : nil
    y > 0 ? y : nil
  end
end
