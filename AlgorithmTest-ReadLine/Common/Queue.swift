//
//  Queue.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/26/24.
//

import Foundation

struct Queue<T> {
    private class Node {
        var value: T
        var next: Node?
        
        init(_ value: T) {
            self.value = value
        }
    }
    
    private var head: Node?
    private var tail: Node?
    /// 큐의 크기를 반환
    private(set) var count = 0
    
    mutating func enqueue(_ element: T) {
        let newNode = Node(element)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
        
        count += 1
    }
    
    mutating func dequeue() -> T? {
        let value = head?.value
        self.head = head?.next
        
        if self.head == nil {
            tail = nil
        }
        
        // 카운트 수가 0 미만으로 떨어지는것 방지
        count -= count > 0 ? 1 : 0
        return value
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    var first: T? {
        head?.value
    }
    
    var last: T? {
        tail?.value
    }
}
