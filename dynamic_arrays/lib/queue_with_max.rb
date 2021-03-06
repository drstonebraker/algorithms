# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
    @max_idx = nil
    @length = 0
  end

  def enqueue(val)
    @max_idx = @length if val > max
    @length += 1
    @store.push(val)
  end

  def dequeue
    @length -= 1
    val = @store.shift
    if @max_idx == 0
      @max_idx = @store.max_idx
    else
      @max_idx -= 1
    end
    val
  end

  def max
    return -1.0 / 0 unless @max_idx
    @store[@max_idx]
  end

  def length
    @length
  end

end
