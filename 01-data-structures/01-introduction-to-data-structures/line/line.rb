# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    join = members.push(person)
  end

  def leave(person)
    leave = members.delete(person)
  end

  def front
    front = members[0]
  end

  def middle
    middle_num = members.length/2
    middle = members[middle_num]
  end

  def back
    back = members.last
  end

  def search(person)
    search = members.detect {|e| e == person}
  end

  private

  def index(person)
    index = members.index(person)
  end

end
