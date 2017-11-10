class BinaryMinHeap {
  constructor(sortFn) {
    this.sortFn = sortFn || (a, b) => a - b
    this.store = []
  }

  count() {
    return this.store.length
  }

  childIndices(idx) {
    const double = idx * 2
    const leftIdx = double + 1
    const rightIdx = double + 2
    return [leftIdx, rightIdx].filter(idx => this.isInRange(idx))
  }

  isInRange(idx) {
    return idx < this.count() && idx >= 0
  }

  parentIdx(idx) {
    return idx === 0 ? null : Math.floor((idx - 1) / 2)
  }

  heapifyDown(parentIdx)  {
    const childIdxs = this.childIndices(parent)
    const children = childIdxs
      .map(idx => this.store[idx])
    const parent = this.store[parentIdx]
    const minChild = Math.min(...children)
    const minIdx = childIdxs.find(idx => this.store)

    if (
      childIndices(parent).length == 0
      || this.sortFn(minChild, parent) > 0
    ) {
      return
    }

    const [left, right] = children
    const [leftIdx, rightIdx] = childIdxs
    let swapIdx
    if (minChild === left) {
      swapIdx = leftIdx
    } else {
      swapIdx = rightIdx
    }
    [this.store[rightIdx], this.store[parentIdx]] = [this.store[parentIdx], this.store[rightIdx]]

    this.heapifyDown(swapIdx)
  }

  heapifyUp(fromIdx) {
    const parentIdx = this.parentIdx(fromIdx)
    if (!parentIdx) return
    const parentVal = this.store[parentIdx]
    const currentVal = this.store[fromIdx]

    if (this.sortFn(currentVal, parentVal) < 0) {
      [this.store[parentIdx], this.store[fromIdx]] = [currentVal, parentVal]
      this.heapifyUp(parentIdx)
    }
  }


}
