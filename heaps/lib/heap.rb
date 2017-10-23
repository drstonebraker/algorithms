class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new {|a, b| a <=> b}
  end

  def count
    @store.length
  end

  def extract
    min = @store.first
    @store[0] = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, count, &@prc)
    min
  end

  def peek
    @store.first
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, count.pred, count, &@prc)
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
    prc ||= Proc.new {|a, b| a <=> b}

    child_indices = BinaryMinHeap.child_indices(array.length, parent_idx)
    children = child_indices.map {|idx| array[idx]}
    val = array[parent_idx]
    until children.empty? || children.all?{|child| prc.call(val, child) <= 0}
      if children.min(&prc) == children.first
        array[parent_idx], array[child_indices.first] = children.first, val
        parent_idx = child_indices.first
      else
        array[parent_idx], array[child_indices.last] = children.last, val
        parent_idx = child_indices.last
      end

      child_indices = BinaryMinHeap.child_indices(array.length, parent_idx)
      children = child_indices.map {|idx| array[idx]}
      val = array[parent_idx]
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx.zero?
    prc ||= Proc.new {|a, b| a <=> b}

    parent_idx = BinaryMinHeap.parent_index(child_idx)
    parent = array[parent_idx]
    val = array[child_idx]

    while parent && prc.call(val, parent) < 0
      array[parent_idx], array[child_idx] = val, parent
      child_idx = parent_idx

      return array if child_idx.zero?
      parent_idx = BinaryMinHeap.parent_index(child_idx)
      parent = array[parent_idx]
    end

    array
  end
end
