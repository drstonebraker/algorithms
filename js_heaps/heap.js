class BinaryMinHeap {
  constructor(sortFn) {
    this.sortFn = sortFn || ((a, b) => a - b)
    this.store = []
  }

  count() {
    return this.store.length
  }

  childIndices(idx) {
    const double = idx * 2
    const leftIdx = double + 1
    const rightIdx = double + 2
    return [leftIdx, rightIdx].filter(newIdx => this.isInRange(newIdx))
  }

  isInRange(idx) {
    return idx < this.count() && idx >= 0
  }

  parentIdx(idx) {
    return idx === 0 ? null : Math.floor((idx - 1) / 2)
  }

  heapifyDown(parentIdx)  {
    const childIdxs = this.childIndices(parentIdx)
    const children = childIdxs
      .map(idx => this.store[idx])
    const parent = this.store[parentIdx]
    const minChild = Math[this.sortFn(1,2) < 0 ? 'min' : 'max'](...children)

    if (
      childIdxs.length == 0
      || this.sortFn(minChild, parent) > 0
    ) {
      return this
    }

    const [left, right] = children
    const [leftIdx, rightIdx] = childIdxs
    const swapIdx = minChild === left ? leftIdx : rightIdx;

    [this.store[swapIdx], this.store[parentIdx]] 
    = [this.store[parentIdx], this.store[swapIdx]]

    this.heapifyDown(swapIdx)
    return this
  }

  heapifyUp(fromIdx) {
    const parentIdx = this.parentIdx(fromIdx)
    if (parentIdx === undefined) return
    const parentVal = this.store[parentIdx]
    const currentVal = this.store[fromIdx]

    if (this.sortFn(currentVal, parentVal) < 0) {
      [this.store[parentIdx], this.store[fromIdx]] 
      = [currentVal, parentVal]
      this.heapifyUp(parentIdx)
    }
  }

  push(val) {
    this.store.push(val)
    this.heapifyUp(this.count() - 1)
    return this
  }

  peek() {
    if (this.count() === 0) throw new Error('Heap is empty')
    return this.store[0]
  }

  extract() {
    if (this.count() === 0) throw new Error('No element to extract')

    [this.store[0], this.store[this.count() - 1]] 
    = [this.store[this.count() - 1], this.store[0]]
    const result = this.store.pop()
    if (this.count() > 0) this.heapifyDown(0)
    return result
  }

}

module.exports = BinaryMinHeap
