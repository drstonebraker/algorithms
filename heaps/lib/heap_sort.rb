require_relative "heap"

class Array
  def heap_sort!
    length.times do |idx|
      BinaryMinHeap.heapify_up(self, idx)
    end
    length.downto(1) do |sub_length|
      self[0], self[sub_length.pred] = self[sub_length.pred], self[0]
      BinaryMinHeap.heapify_down(self, 0, sub_length.pred)
    end
    self.reverse!
  end
end
