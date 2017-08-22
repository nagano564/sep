class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue.insert(0, element)
    @head = @queue[-1]
    @tail = @queue[0]
  end

  def dequeue
    @queue.delete_at(-1)
    @tail = @queue[0]
  end

  def empty?
    @queue.count == 0
  end
end
