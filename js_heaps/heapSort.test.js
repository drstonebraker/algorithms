Array.prototype.heapSort = require('./heapSort')

describe('Array', () => {
  describe('heapSort', () => {
    test('sorts an unsorted array', () => {
      let arr = [4,2,1,3,5,7,8,9]
      arr = arr.heapSort()
      expect(arr).toEqual([1,2,3,4,5,7,8,9])
    })

    test('sorts a reversed array', () => {
      let arr = [5,4,3,2,1]
      arr = arr.heapSort()
      expect(arr).toEqual([1,2,3,4,5])
    })

    test("doesn't sort a sorted array", () => {
      let arr = [1,2,3,4,5]
      arr = arr.heapSort()
      expect(arr).toEqual([1,2,3,4,5])
    })
  })

  describe('heapSort with a comparison function', () => {
    test('sorts reversed', () => {
      let arr = [2,5,1,6,2,3,4]
      arr = arr.heapSort((a,b) => b - a)
      expect(arr).toEqual([6,5,4,3,2,2,1])
    })
  })
})