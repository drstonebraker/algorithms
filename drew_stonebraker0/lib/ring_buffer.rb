require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    capacity = 8
    @store = StaticArray.new(capacity)
    @length = 0
    @capacity = capacity
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    index = buffer_idx(index)
    @store[index]
  end

  # O(1)
  def []=(index, val)
    index = buffer_idx(index)
    check_index(index)
    @store[index] = val
  end

  # O(1)
  def pop
    check_index(@length.pred)
    index = buffer_idx(@length.pred)
    @length -= 1
    @store[index]
  end

  # O(1) ammortized
  def push(val)
    check_capacity!
    index = buffer_idx(@length)
    @length += 1
    @store[index] = val
  end

  # O(1)
  def shift
    check_index(0)
    index = buffer_idx(0)
    first = @store[index]

    @length -= 1
    @start_idx += 1
    first
  end

  # O(1) ammortized
  def unshift(val)
    check_capacity!

    @length += 1
    @start_idx -= 1
    index = buffer_idx(0)
    @store[index] = val
  end

  def max_idx
    max = -1.0 / 0
    i = 0

    while i < @length
      idx = buffer_idx(i)
      el = @store[idx]
      max = el if el > max
      i += 1
    end

    max
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def buffer_idx(idx)
    (@start_idx + idx) % @capacity
  end

  def check_index(index)
    raise 'index out of bounds' unless index.between?(0, @length.pred)
  end

  def check_capacity!
    resize! if @length >= @capacity
  end

  def resize!
    new_arr = StaticArray.new(@capacity * 2)
    i = 0

    while i < @length
      idx = buffer_idx(i)
      new_arr[i] = @store[idx]
      i += 1
    end
    @capacity *= 2
    @start_idx = 0
    @store = new_arr
  end
end
