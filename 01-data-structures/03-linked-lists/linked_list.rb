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
  # once my_node.next = nil add node
  # once my_node.next = nil => my_node.next = node
  def add_to_tail(node)
    new_node_currently_adding = node

    if node.next == nil
      # did head change? maybe (when there are no nodes) @head = node
      if @head == nil
         @head = new_node_currently_adding
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
    # once node.next = nil remove node
    #start at head loop through until next = tail

    # What happens if the list is empty? We do nothing
    # What happens if the list has one item?
    # What happens if the list has two items?

    if @head != nil
      if @head.next == nil
        @head = nil
        @tail = nil
      else
        pointer_node = @head
        until pointer_node.next == @tail
          pointer_node = pointer_node.next
        end
        pointer_node.next = nil
        @tail = pointer_node
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
  # if list is empty head = node
  # if list has one item head = node and head.next = old head
  def add_to_front(node)
    if @head == nil
       @head = node
       @head.next = nil
       @tail = @head
    else
        node.next = @head
        @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    #remove and returns the first node
    # @head.next = nil
    # set 2nd node to head
    # @head.next = @head?
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

        # 1 > 2 > 4
        # @head = 1, 1.next = 2, 2.next = 3, 3.next = 3
        # some_variable = 3
        # some_variable = 4
        # d_node = d_node.next
        #how to make sure list links up properly
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
end

# Create new Array/LinkedList
# add the string "item" to the end 10000 times
#   for an Array: array.push(Node.new("item"))
#   for a LinkedList: linked_list.add_to_tail(Node.new("item"))
array = []
# # puts Benchmark.measure { array.push(Node.new("item")) }
# #
linked_list = LinkedList.new
# # puts Benchmark.measure { linked_list.add_to_tail(Node.new("item")) }
#
n = 10000
Benchmark.bm do |x|
  x.report do
    n.times do
      array.push(Node.new("item"))
    end
  end

  x.report do
    # linked list test
    n.times do
      linked_list.add_to_tail(Node.new("item"))
    end
  end
end
#
Benchmark.bm do |x|
  x.report ("array find :")do
    # array test
       array[5000]
  end

  x.report ("linked_list find: ") do
     linked_list.find(5000)
  end
end


  Benchmark.bm do |x|
    x.report do
      # array test
      array.delete_at(5000)
    end

    x.report do
      # linked list test
      linked_list.remove_at(5000)
    end
  end
