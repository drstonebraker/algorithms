class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new {|a, b| a <=> b}
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    double = parent_index * 2
    [double.next, (double + 2)].reject {|idx| idx >= len}
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index.zero?
    child_index.pred / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    child_indices = BinaryMinHeap.child_indices(array.length, parent_idx)
    children = child_indices.map {|idx| array[idx]}
    val = array[parent_index]
    while @prc.call(val, children.max) > 0
      if @prc.call(val, children.first)
        array[parent_index], array[child_indices.first] = children.first, val
        parent_idx = child_indices.first
      else
        array[parent_index], array[child_indices.last] = children.last, val
        parent_idx = child_indices.last
      end

      child_indices = BinaryMinHeap.child_indices(array.length, parent_idx)
      children = child_indices.map {|idx| array[idx]}
      val = array[parent_index]
    end
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
