//
//  PriorityQueue.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/12/18.
//

import Foundation

struct PriorityQueue<T: Comparable> {
    private var elements: [T] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    mutating func enqueue(_ element: T) {
        elements.append(element)
        heapifyUp()
    }

    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }

        elements.swapAt(0, count - 1)
        let dequeuedElement = elements.removeLast()
        heapifyDown()
        return dequeuedElement
    }

    private mutating func heapifyUp() {
        var currentIndex = count - 1
        var parentIndex = self.parentIndex(of: currentIndex)

        while currentIndex > 0 && elements[currentIndex] < elements[parentIndex] {
            elements.swapAt(currentIndex, parentIndex)
            currentIndex = parentIndex
            parentIndex = self.parentIndex(of: currentIndex)
        }
    }

    private mutating func heapifyDown() {
        var currentIndex = 0

        while true {
            let leftChildIndex = leftChildIndex(of: currentIndex)
            let rightChildIndex = rightChildIndex(of: currentIndex)

            var minIndex = currentIndex

            if leftChildIndex < count && elements[leftChildIndex] < elements[minIndex] {
                minIndex = leftChildIndex
            }

            if rightChildIndex < count && elements[rightChildIndex] < elements[minIndex] {
                minIndex = rightChildIndex
            }

            if minIndex == currentIndex {
                break
            }

            elements.swapAt(currentIndex, minIndex)
            currentIndex = minIndex
        }
    }

    private func parentIndex(of index: Int) -> Int {
        guard index > 0 else {
            return 0
        }
        return (index - 1) / 2
    }

    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }

    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
}
