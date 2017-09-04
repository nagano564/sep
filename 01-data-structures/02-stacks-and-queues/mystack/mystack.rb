class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    push = stack.insert(item)
  end

  def pop(item)
    pop = stack.shift(item)
  end

  def empty?
    empty = store.count == 0
  end
end
