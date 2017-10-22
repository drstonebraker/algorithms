require_relative 'bst_node'
# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    new_node = value.is_a?(BSTNode) ? value : BSTNode.new(value)
    if @root.nil?
      @root = insert_child(@root, new_node)
    elsif new_node <= @root
      @root.left = insert_child(@root.left, new_node)
    else
      @root.right = insert_child(@root.right, new_node)
    end
    new_node
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    if value == tree_node.value
      tree_node
    elsif value < tree_node.value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end

  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

  def insert_child(child, new_node)
    return new_node if child.nil?
    child_tree = BinarySearchTree.new
    child_tree.root = child
    child_tree.insert(new_node)
    child
  end

end
