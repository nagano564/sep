require_relative 'node'
require 'thread'
require 'pry'
require 'byebug'

class MinHeap
  attr_reader :root
  attr_reader :count

  def initialize(root)
    @root = root
    @count = 1
    @last_node = nil
  end

  def insert(root, node)
    puts "Inserting #{node.title}: #{node.rating}"
    @count += 1
    row_number = (Math.log2(@count)).floor
    row_max_count = 2 ** row_number
    tree_capacity = 2 ** (row_number + 1 ) - 1
    target_location = row_max_count - (tree_capacity - @count)
    return nil if node.nil?

    if target_location <= ( row_max_count / 2 )
      # go left
      if root.left == nil
        root.left = node
        node.parent = root
        swap_up(node)
        return
      else
        insert(root.left, node)
      end

    else
      # go right
      if root.right == nil
        root.right = node
        node.parent = root
        swap_up(node)
        return
      else
        insert(root.right, node)
      end
    end
    printf(root)
    puts "=========="
  end

  def swap_up(node)
    parent_node = node.parent
    # unless pacific rim is nil || pacific rim's rating <= braveheart's rating -> 72 <= 78
    unless parent_node.nil? || parent_node.rating <= node.rating
      # Handle the parents
      grandparent = parent_node.parent
      parent_node.parent = node
      node.parent = grandparent

      # Handle the lefts
      node_left = node.left

      unless grandparent.nil?
        grandparent.left = node
      else
        @root = node
      end

      node.left = parent_node
      parent_node.left = node_left

      # Hangle the rights
      node_right = node.right

      unless grandparent.nil?
        grandparent.right = node
        node.right = parent_node
      else
        node.right = parent_node.right # this line is wrong for GP case
      end
      parent_node.right = node_right
    end
  end

  def delete(root, data)
    if root.nil? || data.nil?
      return nil
    end

    node = find(root,data)
  end

  # Recursive Depth First Search
  def find(root, data)
    if data.nil?
      return nil
    end

    if root.title == data
      return root
    end

    unless root.left.nil?
        answer = find(root.left, data)
        return answer unless answer == nil
    end

    unless root.right.nil?
      return find(root.right, data)
    end
  end

  def printf(node)
    return nil if node.nil?
    queue = Queue.new
    queue.enq(node)
    result = nil
    until queue.empty?
      value = queue.deq
      puts "#{value.title}: #{value.rating}" if !value.title.nil?
      # keep moving the levels in tree by pushing left and right nodes of tree in queue
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end
end

# root = Node.new("The Matrix", 87)
#
# heap = MinHeap.new(root)
#
# p_rim = Node.new("Pacific Rim", 72)
# brave = Node.new("Braveheart", 78)
# jedi = Node.new("Star Wars: Return of the Jedi", 80)
# heap.insert(root, p_rim)
# byebug
# heap.insert(root, brave)
# byebug
# heap.insert(root, jedi)
