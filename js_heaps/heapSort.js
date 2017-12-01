const BinaryMinHeap = require('heap')

Array.prototype.heapSort = function heapSort(compareFn) {
    const bmh = new BinaryMinHeap(compareFn)

    this.forEach((el) => bmh.push(el))

    const result = []

    for (let i = 0; i < bmh.count; i++) {
        result.push(bmh.extract())
    }

    return result
}