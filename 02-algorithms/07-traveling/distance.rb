class Distance
  attr_reader :x1, :x2, :y1, :y2

  def initialize(x1,y1,x2,y2)
  	@x1 = x1
  	@x2 = x2
  	@y1 = y1
  	@y2 = y2
  end

  def how_far
    x3 = (x2 - x1) ** 2
    y3 = (y2 - y1) ** 2
    c = x3 + y3
    Math.sqrt(c)
  end
end
