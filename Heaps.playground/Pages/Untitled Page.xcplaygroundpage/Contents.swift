import Foundation

/*
 
 MARK: - Definition
 
 A Binary heap is similar to a binary seach tree. In a MaxBinaryHeap, parent values are always larger than child values. In a MinBinaryHeap, parent values are always smaller than child values
 
 Binary Heaps are used to implement Priority Queues, which are very commonly used data structures. They are also used a lot with graph traversal algorithms
 
 */

// MARK: - MaxBinaryHeaps

/*
 
 - Each parent has at most two child values
 - The value of each parent node is always greater than its child values
 - In a max binary heap, the parent is greater than the children, but there are no guarantees between sibling values
 - A binary heap is as compact as possible. All the children of each node are as fully as they can be and left children are filled out first
 
 You can find the children of a parent node with simple maths:
 - For any index of an array n...
 - the left child is stored at 2n + 1
 
 You can also find the parent node of a child node with
 - For any child node at index n...
 - its parent is at index (n-1)/2 (floored)
 
 */

// MARK: - Heap Sort

class MaxHeap {
    
    var values = [Int]()
    
//    init(values: [Int]) {
//        self.values = values
//    }
    
    func insert(element: Int) {
        self.values.append(element)
        self.bubbleUp()
    }
    
    func bubbleUp() {
        var idx = self.values.count - 1
        let element = self.values[idx]
        while idx > 0 {
            // formula to get the parentIndex given index of child node (n-1)/2 (floored)
            let parentIdx = Int((idx - 1) / 2)
            let parent = self.values[parentIdx]
            // no swapping of values
            if(element <= parent) {
                break
            } // else, swap childNode with parentNode
            self.values[parentIdx] = element
            self.values[idx] = parent
            idx = parentIdx
            print(self.values)
        }
    }

}
    
    

let heapArray = [41,39,33,18,27,12]
var heap = MaxHeap()
heap.insert(element: 1)
heap.insert(element: 55)



struct MinHeap {
    var items: [Int] = []
    
    //Get Index
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    // Boolean Check
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    // Return Item From Heap
    private func leftChild(_ index: Int) -> Int {
        return items[getLeftChildIndex(index)]
    }
    private func rightChild(_ index: Int) -> Int {
        return items[getRightChildIndex(index)]
    }
    private func parent(_ index: Int) -> Int {
        return items[getParentIndex(index)]
    }
    public func peek() -> Int {
      if items.count != 0 {
          return items[0]
      } else {
          fatalError()
      }
    }
    mutating public func poll() -> Int {
      if items.count != 0 {
          let item = items[0]
          items[0] = items[items.count - 1]
          heapifyDown()
          items.removeLast()
          print(self.items)
          return item
      } else {
          fatalError()
      }
    }
    mutating public func add(_ item: Int) {
      items.append(item)
      heapifyUp()
        print(self.items)
    }
    
    mutating private func swap(indexOne: Int, indexTwo: Int) {
      let placeholder = items[indexOne]
      items[indexOne] = items[indexTwo]
      items[indexTwo] = placeholder
    }
    
    mutating private func heapifyUp() {
      var index = items.count - 1
      while hasParent(index) && parent(index) > items[index] {
          swap(indexOne: getParentIndex(index), indexTwo: index)
          index = getParentIndex(index)
      }
    }
    
    mutating private func heapifyDown() {
      var index = 0
      while hasLeftChild(index) {
          var smallerChildIndex = getLeftChildIndex(index)
          if hasRightChild(index) && rightChild(index) < leftChild(index) {
              smallerChildIndex = getRightChildIndex(index)
          }

          if items[index] < items[smallerChildIndex] {
              break
          } else {
              swap(indexOne: index, indexTwo: smallerChildIndex)
          }
          index = smallerChildIndex
      }
    }
}

var myHeap = MinHeap()

myHeap.add(2)
myHeap.add(10)
myHeap.add(8)
myHeap.add(9)
myHeap.add(7)
myHeap.add(3)
myHeap.add(4)
myHeap.poll()
