require 'byebug'
class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return if length <= 1
    pivot_idx = partition(array, start, length, &prc)

    sort2!(array, start, pivot_idx - start, &prc)
    sort2!(array, pivot_idx.next, length - (pivot_idx.next - start), &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|a, b| a <=> b}

    # pivot_idx = length / 2
    # swap(array, start, pivot_idx)
    pivot_idx = start

    pivot = array[pivot_idx]


    length.pred.times do |i|
      idx = start.next + i
      if prc.call(array[idx], pivot) <= 0
        swap(array, idx, pivot_idx.next)
        pivot_idx += 1
      end
    end

    swap(array, start, pivot_idx)
    pivot_idx
  end

  private

  def self.swap(arr, i1, i2)
    arr[i1], arr[i2] = arr[i2], arr[i1]
  end
end
