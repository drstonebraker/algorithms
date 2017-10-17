require_relative "static_array"
require 'byebug'

class DynamicArray
  attr_reader :length

  def initialize
    capacity = 4
    @arr = StaticArray.new(capacity)
    @length = 0
    @capacity = capacity
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' unless (0...length).include?(index)
    @arr[index]
  end

  # O(1)
  def []=(index, value)
    raise 'index out of bounds' unless (0...length).include?(index)
    @arr[index] = value
  end

  # O(1)
  def pop
    raise 'cannot pop empty array' if @length == 0
    @length -= 1
    p @arr
    @arr[@length]
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length >= @capacity
    @length += 1
    @arr[@length.pred] = val
  end

  # O(n): has to shift over all the elements.
  def shift
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_arr = StaticArray.new(@capacity * 2)
    i = 0

    while i < @length
      new_arr[i] = @arr[i]
      i += 1
    end
    @capacity *= 2
    @arr = new_arr
  end
end
