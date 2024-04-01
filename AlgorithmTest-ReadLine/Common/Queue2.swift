//
//  Queue2.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/27/24.
//

// import Foundation

struct Queue2<T> {
    private var array: [T] = []
    private var index: Int = 0
    
    var size: Int {
        return array.count - index
    }
    
    var front: T? {
        return self.isEmpty ? nil : array[index]
    }
    
    var back: T? {
        return self.isEmpty ? nil : array.last
    }
    
    var isEmpty: Bool {
        return array.count - index <= 0
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        guard !self.isEmpty else {
            return nil
        }
        
        let element = array[index]
        index += 1
        return element
    }
}
