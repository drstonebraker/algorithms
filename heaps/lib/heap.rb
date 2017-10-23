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
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
