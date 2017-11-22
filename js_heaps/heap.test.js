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
        bmh20.push(i)
      }
    })

    test('calculates child indices correctly', () => {
      expect(bmh20.childIndices(0)).toEqual([1, 2])
      expect(bmh20.childIndices(1)).toEqual([3,4])
      expect(bmh20.childIndices(2)).toEqual([5])
    })


  })
})
