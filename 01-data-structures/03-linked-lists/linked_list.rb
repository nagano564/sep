require_relative 'node'
require 'byebug'
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
    if @head.nil?
      @head = node
      @tail = node
      @tail.next = nil
    else
      @tail.next = node
      @tail = node
      @tail.next =nil
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  # once node.next = nil remove node
  #start at head loop through until next = tail
  # What happens if the list is empty? We do nothing
  # What happens if the list has one item?
  # What happens if the list has two items?

  def remove_tail
    return if @head.nil?

    if @head == @tail
       @head = nil
       @tail = nil
    else
      pointer_node = @head
      until pointer_node.next == @tail
        pointer_node = pointer_node.next
      end
      @tail = pointer_node
      @tail.next = nil
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
  #  loop thru until node.next == node and then next node is the one to delete
  #  node.delete

  def delete(node)
    if node == @head
      remove_front
    elsif node == @tail
      remove_tail
    else
      delete_node(node)
    end
  end

  def delete_node(node)
    pointer_node = @head
    until pointer_node.next == node
      if pointer_node.next == @tail
        puts "#{node.data} not in this linked list"
        break
      else
        pointer_node = pointer_node.next
      end
    end
    pointer_node.next = pointer_node.next.next
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  # if list is empty head = node
  # if list has one item head = node and head.next = old head
  def add_to_front(node)
    if @head.nil?
      @head = node
      @tail = node
      @tail.next = nil
    else
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  #remove and returns the first node
  # @head.next = nil
  # set 2nd node to head
  # @head.next = @head?

  def remove_front
    return if @head.nil?

    if @head == @tail
      @head = nil
      @tail = nil
    else
      @head = @head.next
    end
  end


  # 1 > 2 > 4
  # @head = 1, 1.next = 2, 2.next = 3, 3.next = 3
  # some_variable = 3
  # some_variable = 4
  # pointer = pointer.next
  #how to make sure list links up properly
  def remove_at(index)
    return if @head.nil?

    pointer = @head
    (index - 1).times do
      if pointer.next != nil
        pointer = pointer.next
      end
    end
     pointer.next = pointer.next.next
  end

  def find(index)
    node_to_find = @head
    index.times do
      if node_to_find.next != nil
        node_to_find = node_to_find.next
      end
    end
    node_to_find
  end
end

# # Create new Array/LinkedList
# # add the string "item" to the end 10000 times
# #   for an Array: array.push(Node.new("item"))
# #   for a LinkedList: linked_list.add_to_tail(Node.new("item"))
# array = []
# # # puts Benchmark.measure { array.push(Node.new("item")) }
# # #
# linked_list = LinkedList.new
# # # puts Benchmark.measure { linked_list.add_to_tail(Node.new("item")) }
# #
# n = 10000
# Benchmark.bm do |x|
#   x.report do
#     n.times do
#       array.push(Node.new("item"))
#     end
#   end
#
#   x.report do
#     # linked list test
#     n.times do
#       linked_list.add_to_tail(Node.new("item"))
#     end
#   end
# end
# #
# Benchmark.bm do |x|
#   x.report ("array find :")do
#     # array test
#        array[5000]
#   end
#
#   x.report ("linked_list find: ") do
#      linked_list.find(5000)
#   end
# end
#
#
#   Benchmark.bm do |x|
#     x.report do
#       # array test
#       array.delete_at(5000)
#     end
#
#     x.report do
#       # linked list test
#       linked_list.remove_at(5000)
#     end
#   end
