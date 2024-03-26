//
//  PriorityQueueUseAbsValue.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/26/24.
//

import Foundation

/// 최소 힙을 이용한 우선순위 큐 구조체
struct PriorityQueueUseAbsValue {
    private var elements: [Int] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    mutating func enqueue(_ element: Int) {
        elements.append(element)
        heapifyUp()
    }

    mutating func dequeue() -> Int? {
        guard !isEmpty else { return nil }

        elements.swapAt(0, count - 1)
        let dequeuedElement = elements.removeLast()
        heapifyDown()
        return dequeuedElement
    }

    private mutating func heapifyUp() {
        var currentIndex = count - 1
        var parentIndex = self.parentIndex(of: currentIndex)

        while currentIndex > 0 && isNeedSwap(base: elements[currentIndex], compare: elements[parentIndex]) {
            // 조건 1: 부모 인덱스의 값보다 자식 인덱스의 값이 작으면 스왑 (최소 힙을 유지하기 위해)
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
            
            // 조건 2: minIndex의 값보다 왼쪽 자식 인덱스의 값이 작다면 => minIndex를 갱신
            if leftChildIndex < count && isNeedSwap(base: elements[leftChildIndex], compare: elements[minIndex]) {
                minIndex = leftChildIndex
            }
            
            // 조건 3: minIndex의 값보다 오른쪽 자식 인덱스의 값이 작다면 => minIndex를 갱신
            if rightChildIndex < count && isNeedSwap(base: elements[rightChildIndex], compare: elements[minIndex]) {
                minIndex = rightChildIndex
            }

            // 어떠한 조건도 만족하지 않는다면 (minIndex가 변경되지 않은 상태라면) 중지
            if minIndex == currentIndex {
                break
            }

            // 작은 값과 현재 값을 스왑
            elements.swapAt(currentIndex, minIndex)
            currentIndex = minIndex
        }
    }
    
    private func isNeedSwap(base: Int, compare: Int) -> Bool {
        abs(base) < abs(compare) || (abs(base) == abs(compare) && (base < compare))
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
