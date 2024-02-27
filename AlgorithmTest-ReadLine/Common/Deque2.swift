//
//  Deque2.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/27/24.
//

import Foundation

struct Deque2<T> {
    private var enq: [T] = .init(), deq: [T] = .init()
    
    var isEmpty: Bool {
        deq.isEmpty && enq.isEmpty ? true : false
    }

    /// 원소 개수
    var count: Int {
        deq.count + enq.count
    }
    
    /// 앞에 삽입
    mutating func enqueueFront(_ element: T) {
        deq.append(element)
    }

    /// 뒤에 삽입
    mutating func enqueueRear(_ element: T) {
        enq.append(element)
    }

    /// 앞 빼고 제거
    mutating func dequeueFront() -> T? {
        if deq.isEmpty {
            if enq.isEmpty {
                return nil
            }
            
            deq = enq.reversed()
            enq.removeAll()
            return deq.popLast()!
        } else {
            return deq.popLast()!
        }
    }

    /// 뒤 빼고 제거
    mutating func dequeueRear() -> T? {
        if enq.isEmpty {
            if deq.isEmpty {
                return nil
            }
            
            enq = deq.reversed()
            deq.removeAll()
            return enq.popLast()!
        } else {
            return enq.popLast()!
        }
    }

    /// 앞
    func front() -> T? {
        if deq.isEmpty, enq.isEmpty {
            return nil
        }
        
        return deq.isEmpty ? enq.first! : deq.last!
    }

    /// 뒤
    func rear() -> T? {
        if deq.isEmpty, enq.isEmpty {
            return nil
        }
        
        return enq.isEmpty ? deq.first! : enq.last!
    }
}
