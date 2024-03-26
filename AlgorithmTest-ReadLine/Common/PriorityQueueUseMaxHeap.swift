//
//  PriorityQueueUseMaxHeap.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/26/24.
//

import Foundation

/// 최대 힙을 이용한 우선순위 큐 구조체
struct PriorityQueueUseMaxHeap<T: Comparable> {
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

        while currentIndex > 0 && elements[currentIndex] > elements[parentIndex] {
            // 부모 인덱스의 값보다 자식 인덱스의 크면 작으면 스왑 (최대 힙을 유지하기 위해)
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

            var maxIndex = currentIndex

            // maxIndex의 값보다 왼쪽 자식 인덱스의 값이 크다면 => maxIndex를 갱신
            if leftChildIndex < count && elements[leftChildIndex] > elements[maxIndex] {
                maxIndex = leftChildIndex
            }

            if rightChildIndex < count && elements[rightChildIndex] > elements[maxIndex] {
                maxIndex = rightChildIndex
            }

            // 어떠한 조건도 만족하지 않는다면 (maxIndex가 변경되지 않은 상태라면) 중지
            if maxIndex == currentIndex {
                break
            }

            // 큰 값과 현재 값을 스왑
            elements.swapAt(currentIndex, maxIndex)
            currentIndex = maxIndex
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
