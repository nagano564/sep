require_relative 'node'
require 'pry'
require 'benchmark'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    new_node = node
    if node.next == nil
      # did head change? maybe (when there are no nodes) @head = node
      if @head == nil
        @head = new_node
        @tail = @head
        @tail.next = nil
    # did tail change? yes => @tail = node
      else
        @tail.next = node
        @tail = node
        @tail.next = nil
      end
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail

    if @head != nil
      if @head.next == nil
        @head = nil
        @tail = nil
      else
        a_node = @head
        until a_node.next == @tail
          a_node = a_node.next
        end
        a_node.next = nil
        @tail = a_node
        @tail.next = nil
      end
    end
  end

  # This method prints out a representation of the list.
  def print
      current_node = @head

      while current_node != nil
          puts "#{current_node.data}"
          current_node = current_node.next
      end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
  #  loop thru until node.next == node and then next node is the one to delete
  #  node.delete
    if head == nil
      #do nothing
    elsif head == tail
      @head = nil
      @tail = nil
    elsif node == @head
      self.remove_front
    elsif node == @tail
      self.remove_tail
    else
      b_node = @head
      until b_node.next == node
        b_node = b_node.next
      end
      b_node.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)

    if @head == nil
      @head = node
      @head.next = nil
      @tail = @head
    elsif @head != nil
        node.next = @head
        @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if head == nil
    	#do nothing
    	elsif head == tail
    		@head = nil
    		@tail = nil
    	else
    		@head = head.next
    end
  end

  def remove_at(index)
    if @head == nil
    else
      d_node = @head
      (index - 1).times do
        if d_node.next != nil
          d_node = d_node.next
        end
      end
       d_node.next = d_node.next.next
    end
  end

  def find(index)
    c_node = @head
      index.times do
        if c_node.next != nil
            c_node = c_node.next
        end
      end
      c_node
  end

  def each
    node = @head
    until node == nil
      yield node
      node = node.next
    end
  end
end
