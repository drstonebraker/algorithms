const BinaryMinHeap = require('./heap')

describe('BinaryMinHeap', () => {
  describe('heap operation', () => {
    test('has a store that starts empty', () => {
      const heap = new BinaryMinHeap()
      expect(heap.store).toEqual([])
    })

    test('pushes correctly', () => {
      const heap = new BinaryMinHeap()
      heap.push(7)
      expect(heap.store).toEqual([7])

      heap.push(5)
      expect(heap.store).toEqual([5,7])

      heap.push(6)
      expect(heap.store).toEqual([5,7,6])

      heap.push(4)
      expect(heap.store).toEqual([4,5,6,7])
    })
  })

  describe('indexing functions', () => {
    let bmh20
    beforeEach(() => {
      bmh20 = new BinaryMinHeap()
      for (var i = 0; i < 6; i++) {
        bmh20.store[i] = i
      }
    })

    test('calculates child indices correctly', () => {
      expect(bmh20.childIndices(0)).toEqual([1, 2])
      expect(bmh20.childIndices(1)).toEqual([3,4])
      expect(bmh20.childIndices(2)).toEqual([5])
    })

    test('calculates parent indices correctly', () => {
      expect(bmh20.parentIdx(5)).toEqual(2)
      expect(bmh20.parentIdx(4)).toEqual(1)
      expect(bmh20.parentIdx(3)).toEqual(1)
      expect(bmh20.parentIdx(2)).toEqual(0)
      expect(bmh20.parentIdx(1)).toEqual(0)
      expect(bmh20.parentIdx(0)).toEqual(null)
    })
  })

  describe('heapify up and down', () => {
    test('heapifyDowns correctly', () => {
      const bmh = new BinaryMinHeap()
      bmh.store = [7,4,5]
      bmh.heapifyDown(0)
      expect(bmh.store).toEqual([4,7,5])
    })

    test('heapifyUps correctly', () => {
      const bmh = new BinaryMinHeap()
      bmh.store = [4,5,1]
      bmh.heapifyUp(2)
      expect(bmh.store).toEqual([1,5,4])

      bmh.store = [3,4,5,1]
      bmh.heapifyUp(3)
      expect(bmh.store).toEqual([1,3,5,4])
    })
  })
})
