require_relative 'bst_node'
require 'byebug'
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
      @root.left.parent = @root
    else
      @root.right = insert_child(@root.right, new_node)
      @root.right.parent = @root
    end
    new_node
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    new_node = value.is_a?(BSTNode) ? value : BSTNode.new(value)
    if new_node.value == tree_node.value
      tree_node
    elsif new_node.value < tree_node.value
      find(new_node.value, tree_node.left)
    else
      find(new_node.value, tree_node.right)
    end

  end

  def delete(value)
    node = find(value)
    @root = nil if node == @root
    return nil if node.nil?

    # debugger

    case node.num_children
    when 0
      assign_child_to_parent(node, nil)
    when 1
      child = node.only_child
      assign_child_to_parent(node, child)
    when 2
      child = maximum(node.left)
      assign_child_to_parent(node, child)
    end

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    until tree_node.right.nil?
      tree_node = tree_node.right
    end
    tree_node
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil? || tree_node.num_children.zero?

    1 + [depth(tree_node.left), depth(tree_node.right)].max
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

  def assign_child_to_parent(node, child)
    if node.parent
      node.is_left? ? node.parent.left = child : node.parent.right = child
    end
    if child
      delete(child)
      child.parent = node.parent
    end
    node.parent = nil
    node.left = nil
    node.right = nil
  end

end
