require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = matrix
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    width = x
    height = y
    @matrix = Array.new(x) {Array.new(y)}
  end

  def at(x, y)

  end

  private

  def inbounds(x, y)
    x > 0 ? x : nil
    y > 0 ? y : nil
  end

end
