//
//  Heap2.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/23/24.
//

import Foundation

/// 보다 빠른 속도의 힙
struct Heap2<T> {
    var arr:[T]
    var compare:(T, T) -> Bool
    
    var isEmpty: Bool {
        return arr.isEmpty
    }
    
    var count: Int {
        return arr.count
    }
    
    init(arr: [T] = [], compare: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.compare = compare
    }
    
    mutating private func shiftUp(_ a: Int) {
        var i = a
        while i > 0 {
            let parent = (i-1)/2
            if compare(arr[i], arr[parent]) {
                arr.swapAt(i, parent)
                i = parent
            } else {
                break
            }
        }
    }
    
    mutating private func shiftDown(_ a: Int) {
        var i = a
        var child = 2*i+1
        let count = arr.count
        while child < count {
            if child+1 < count && compare(arr[child+1], arr[child]) {
                child += 1
            }
            
            if compare(arr[child], arr[i]) {
                arr.swapAt(i, child)
                i = child
                child = 2*i+1
            } else {
                break
            }
        }
    }
    
    mutating func enqueue(_ a: T) {
        arr.append(a)
        shiftUp(arr.count-1)
    }
    
    mutating func dequeue() -> T? {
        if arr.isEmpty {
            return nil
        } else {
            arr.swapAt(0, arr.count-1)
            let result = arr.popLast()
            shiftDown(0)
            return result
        }
    }
}
