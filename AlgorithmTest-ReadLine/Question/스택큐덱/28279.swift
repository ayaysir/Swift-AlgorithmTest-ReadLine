//
//  28279.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/27/24.
//

import Foundation

func Q_28279() {
    // import Foundation
    
    let f = FileIO()
    
    var dq = Deque<Int>(), result = ""
    @inline(__always) func write(_ n: Int) {
        result.write("\(n)\n")
    }
    
    for _ in 0..<f.readInt() {
        switch f.readInt() {
        case 1:
            dq.enqueueFront(f.readInt())
        case 2:
            dq.enqueueRear(f.readInt())
        case 3:
            write(dq.dequeueFront() ?? -1)
        case 4:
            write(dq.dequeueRear() ?? -1)
        case 5:
            write(dq.count)
        case 6:
            write(dq.isEmpty ? 1 : 0)
        case 7:
            write(dq.front() ?? -1)
        case 8:
            write(dq.rear() ?? -1)
        default:
            continue
        }
    }
    
    print(result)
    
    struct Deque<T> {
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

    
    class FileIO {
        @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
        
        @inline(__always) private func readByte() -> UInt8 {
            defer { byteIdx += 1 }
            return buffer.withUnsafeBufferPointer { $0[byteIdx] }
        }
        
        @inline(__always) func readInt() -> Int {
            var number = 0, byte = readByte(), isNegative = false
            while byte == 10 || byte == 32 { byte = readByte() }
            if byte == 45 { byte = readByte(); isNegative = true }
            while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
            return number * (isNegative ? -1 : 1)
        }
        
        @inline(__always) func readStringSum() -> Int {
            var byte = readByte()
            while byte == 10 || byte == 32 { byte = readByte() }
            var sum = Int(byte)
            while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
            return sum - Int(byte)
        }
        
        @inline(__always) private func write(_ output: String) {
            FileHandle.standardOutput.write(output.data(using: .utf8)!)
        }
    }
}

/*
 덱(deque, "deck"과 발음이 같음 ← double-ended queue)은 양쪽 끝에서 삽입과 삭제가 모두 가능한 자료 구조의 한 형태이다.

 두 개의 포인터를 사용하여, 양쪽에서 삭제와 삽입을 발생시킬 수 있다. 큐와 스택을 합친 형태로 생각할 수 있다.
 
 
 [예제]
11
6
1 3
1 8
7
8
3
2 5
1 2
5
4
4
 
 1
 8
 3
 8
 3
 5
 3
 
 [반례]
 input)
4
3
4
7
8

answer :
-1
-1
-1
-1
 
input)
3
6
8
6

answer)
1
-1
1
 
 input)
5
1 10
5
7
4
7
 
 1
 10
 10
 -1
 */


