//
//  2346.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/27/24.
//

// import Foundation

func Q_2346() {
    _ = readLine()
    var dq = Deque2<(i: Int, v: Int)>(), result = ""
    readLine()!.split(separator: " ").enumerated().forEach {
        dq.enqueueRear(($0.offset + 1, Int($0.element)!))
    }
    
    while !dq.isEmpty {
        guard let first = dq.dequeueFront() else {
            break
        }
        
        var move = first.v > 0 ? first.v - 1 : first.v
        result += "\(first.i) "
        
        // + move: dqFront & eqRear 인데 원래 move에서 -1
        // - move: dqRear & enFront 인데 move는 변하지 않음
        while move != 0, !dq.isEmpty {
            if move > 0 {
                let balloon = dq.dequeueFront()!
                dq.enqueueRear(balloon)
                move -= 1
                print(balloon, dq.count)
            } else if move < 0 {
                let balloon = dq.dequeueRear()!
                dq.enqueueFront(balloon)
                move += 1
                print(balloon, dq.count)
            }
        }
    }
    
    print(result)
    
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
}

/*
 [해설]
 덱을 사용해서 앞뒤로 넣어주면서 함
 - (+ move) 인 경우:  dqFront & eqRear 인데 원래 move에서 -1한 만큼 이동해야함 (직접 그려보면서 하면 나옴)
 - (- move) 인 경우: dqRear & enFront 인데 move는 변하지 않음 (직접 그려보면서 하면 나옴)
 - 내부 while문을 move만큼 움직이되, 덱이 비어있지 않은 경우에만
   - (외부 while문에서 무조건 하나 제거하게 되어있으므로 덱은 점점 줄어간다.)
 
 [예제]
 5
 3 2 1 -3 -1
 
 1 4 5 3 2
 */
