//
//  PriorityQueue.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/12/18.
//

import Foundation

/// 최소 힙을 이용한 우선순위 큐 구조체
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
            // 부모 인덱스의 값보다 자식 인덱스의 값이 작으면 스왑 (최소 힙을 유지하기 위해)
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

            // minIndex의 값보다 왼쪽 자식 인덱스의 값이 작다면 => minIndex를 갱신
            if leftChildIndex < count && elements[leftChildIndex] < elements[minIndex] {
                minIndex = leftChildIndex
            }

            if rightChildIndex < count && elements[rightChildIndex] < elements[minIndex] {
                minIndex = rightChildIndex
            }

            // 어떠한 조건도 만족하지 않는다면 (minIndex가 변경되지 않은 상태라면) 중지
            if minIndex == currentIndex {
                break
            }

            // 작은 값과 현재 값을 스왑
            elements.swapAt(currentIndex, minIndex)
            currentIndex = minIndex
            
            /*
             예)
                      10 (currentIndex)
                     /  \
                    15   7 (minIndex)
             
             인 경우 7(minIndex)과 10을 스왑하며 7이 새로운 currentIndex가 됩니다.
             
                     7 (currentIndex == minIndex)
                    /  \
                   15   10
                      
             */
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
