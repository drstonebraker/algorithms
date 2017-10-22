class BSTNode
  attr_accessor :value, :parent, :left, :right

  include Comparable

  def initialize(value)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
  end

  def <=>(comparator)
    @value <=> comparator.value
  end

  def ==(comparator)
    return false if comparator.nil?
    @value == comparator.value
  end

  def is_left?
    @parent.left == self
  end

  def if_right?
    @parent.right == self
  end

  def num_children
    [@left, @right].count { |node| !node.nil? }
  end

  def only_child
    raise 'Can only call #only_child on node with 1 child' unless num_children == 1
    @left || @right
  end
end
