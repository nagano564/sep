class MyStack
  attr_accessor :top
  attr_accessor :stack

  def initialize
    @stack = Array.new
    self.top=(nil)
  end

  def push(item)
    push = stack.insert(0, item)
    self.top = stack[0]
  end

  def pop
    pop = stack.shift
    self.top = stack[0]
    return pop
  end

  def empty?
    empty = stack.count == 0
  end
end
