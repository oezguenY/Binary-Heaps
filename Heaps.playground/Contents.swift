import Foundation

/*
 
 MARK: - Definition
 
 A Binary heap is similar to a binary seach tree. In a MaxBinaryHeap, parent nodes are always larger than child nodes. In a MinBinaryHeap, parent nodes are always smaller than child nodes
 
 Binary Heaps are used to implement Priority Queues, which are very commonly used data structures. They are also used a lot with graph traversal algorithms
 
 */

// MARK: - MaxBinaryHeaps

/*
 
 - Each parent has at most two child nodes
 - The value of each parent node is always greater than its child nodes
 - In a max binary heap, the parent is greater than the children, but there are no guarantees between sibling nodes
 - A binary heap is as compact as possible. All the children of each node are as fully as they can be and left children are filled out first
 
 You can find the children of a parent node with simple maths:
 - For any index of an array n...
 - the left child is stored at 2n + 1
 
 You can also find the parent node of a child node with
 - For any child node at index n...
 - its parent is at index (n-1)/2 (floored)
 
 */

// MARK: - Heap Sort

class MaxBinaryHeap {
    
    var values = [Int]()
    
    init(values: [Int]) {
        self.values = values
    }
    
    func insert(element: Int) {
        self.values.append(element)
        self.bubbleUp()
    }
    
    func bubbleUp() {
        var idx = self.values.count - 1
        let element = self.values[idx]
        while idx > 0 {
            let parentIdx = Int((idx - 1) / 2)
            let parent = self.values[parentIdx]
            if(element <= parent) {
                break
            }
            self.values[parentIdx] = element
            self.values[idx] = parent
            idx = parentIdx
            print(self.values)
        }
    }
}

let heapArray = [41,39,33,18,27,12]
var heap = MaxBinaryHeap(values: heapArray)
heap.insert(element: 1)
heap.insert(element: 55)


