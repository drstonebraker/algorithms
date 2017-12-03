const BinaryMinHeap = require('./heap')

const heapSort = function heapSort(compareFn) {
    const bmh = new BinaryMinHeap(compareFn)

    this.forEach((el) => bmh.push(el))

    const result = []
    const length = bmh.count()

    for (let i = 0; i < length; i++) {
        result.push(bmh.extract())
    }

    return result
}

module.exports = heapSort