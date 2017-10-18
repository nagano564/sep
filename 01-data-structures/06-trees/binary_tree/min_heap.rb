require_relative 'node'
require 'thread'
require 'pry'
require 'byebug'

class MinHeap

  attr_reader :root
  attr_reader :count
  attr_reader :row_number

  def initialize(root)
    @root = root
    @count = 1
  end

  def insert(root, node)
    @count += 1
    row_number = ((Math.log2(@count)).floor)
    row_max_count = 2 ** row_number
    tree_capacity = 2 ** (row_number + 1 ) - 1
    row_midpoint = row_max_count / 2
    target_location = row_max_count - (tree_capacity - @count)
    if root.left.nil?
      root.left = node
      node.parent = root
      swap_up(node)
      return
    elsif root.right.nil?
      root.right = node
      node.parent = root
      swap_up(node)
      return
    end
      if target_location <= row_midpoint
        # go left
        if root.left == nil
          root.left = node
          node.parent = root
          swap_up(node)
        else
          insert(root.left, node)
        end

      else
        # go right
        if root.right == nil
          root.right = node
          node.parent = root
          swap_up(node)
        else
          insert(root.right, node)
        end
      end
  end

  def swap_up(node)
    parent_node = node.parent

    if parent_node != nil
      if parent_node.rating > node.rating
        # Update grandparent
        if parent_node.parent != nil
          if parent_node == parent_node.parent.left
            parent_node.parent.left = node
          else
            parent_node.parent.right = node
          end
          # Update parent
        else
          parent_node.parent = node

          if node == parent_node.right
            node.right = parent_node
            node.left = parent_node.left
          elsif node == parent_node.left
            node.left = parent_node
            node.right = parent_node.right
          end
          parent_node.left = nil
          parent_node.right = nil
          end
        end
    end
    if node.parent != nil
      if node.rating < node.parent.rating
        swap_up(node.parent)
      end
    end
  end

  def delete(root, data)

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

root = Node.new("The Matrix", 87)

heap = MinHeap.new(root)
p_rim = Node.new("Pacific Rim", 72)
brave = Node.new("Braveheart", 78)
jedi = Node.new("Star Wars: Return of the Jedi", 80)


heap.insert(root, p_rim)

heap.insert(p_rim, brave)
heap.insert(p_rim, jedi)
byebug
heap.printf(p_rim)
