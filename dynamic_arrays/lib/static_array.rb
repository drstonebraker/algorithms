# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def initialize(length)
    @store = []
    @length = length
  end

  # O(1)
  def [](index)
    raise 'Index not within bounds of static array' unless (0...@length).include?(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  protected
  attr_accessor :store
end
