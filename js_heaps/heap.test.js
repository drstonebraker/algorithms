const BinaryMinHeap = require('./heap')

describe('BinaryMinHeap', () => {
  describe('heap operation', () => {
    test('has a store that starts empty', () => {
      const heap = new BinaryMinHeap()
      expect(heap.store).toEqual([])
    })
  })

  describe('indexing functions', () => {
    let bmh20
    beforeEach(() => {
      bmh20 = new BinaryMinHeap()
      for (var i = 0; i < 20; i++) {
        bmh20.store[i]
      }
    })

    test('calculates child indices correctly', () => {
      expect(bmh20.childIndices(0)).toEqual([1, 2])
    })


  })
})
