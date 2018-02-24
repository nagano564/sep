require_relative 'node'
require 'thread'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root == nil
      root = node
    end
    if node.rating <= root.rating
      if root.left == nil
        root.left = node
        node.parent = root
      else
        insert(root.left, node)
      end
    else node.rating > root.rating
      if root.right == nil
        root.right = node
        node.parent = root
      else
        insert(root.right, node)
      end
    end
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

  def delete(root, data)
    if data.nil?
      return nil
    end

    node_to_delete = find(root, data)
    if (root.left && root.left.title == node_to_delete.title) || (root.right && root.right.title == node_to_delete.title)
      if node_to_delete.right.nil? && node_to_delete.left.nil?
        node_to_delete.rating > root.rating ? root.right = nil : root.left = nil
      elsif node_to_delete.rating > root.rating
        if node_to_delete.left && node_to_delete.right.nil?
          root.right = node_to_delete.left
        elsif node_to_delete.left.nil? && node_to_delete.right
          root.right = node_to_delete.right
        else
          current_node = node_to_delete.left
          while current_node.right
            parent = current_node
            current_node = current_node.right
          end
          root.right = current_node
          delete(parent, current_node)
        end
      end
    elsif node_to_delete.rating >= root.rating
      delete(root.right, node_to_delete.title)
    else
      delete(root.left, node_to_delete.title)
    end
  end

  # Recursive Breadth First Search
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
