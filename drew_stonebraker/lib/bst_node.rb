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
end
