//
//  18258.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/26/24.
//

import Foundation

// 149940KB    468ms
func Q_18258() {
    var q: [Int] = [], i = 0, f = IO(), result = "", qIsEmpty = {q.count - i <= 0}

    for _ in 0..<f.readInt() {
        switch f.readStringSum() {
        case 448: // enqueue
            q.append(f.readInt())
        case 335: // dequeue
            if !qIsEmpty() {
                let element = q[i]
                i += 1
                result.write("\(element)\n")
            } else {
                result.write("-1\n")
            }
        case 443: // size
            result.write("\(q.count - i)\n")
        case 559: // empty
            result.write("\(qIsEmpty() ? 1 : 0)\n")
        case 553: // front
            result.write("\(qIsEmpty() ? -1 : q[i])\n")
        case 401: // back
            result.write("\(qIsEmpty() ? -1 : q.last!)\n")
            // 💥💥💥
            // q.last ?? -1가 아님: 실질 큐의 isEmpty인지 먼저 확인하고 비어있지 않은 경우에만 마지막 요소를 출력
            // 예) [1,2,3]인데 i = 3인 경우 원래 -1을 출력해야되지만 기존 코드에서는 3을 출력
            // qIsEmpty를 체크하지 않아서 계속 틀림처리 되었음
        default: continue
        }
    }

    print(result)

    final class IO {
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

// 194504KB    548ms
func Q_18258_CUSTOM() {
    var q = Queue<Int>(), f = IO(), s = ""
    for _ in 0..<f.readInt() {
        switch f.readStringSum() {
        case 448:
            q.enqueue(f.readInt())
        case 335:
            s.write("\(q.dequeue() ?? -1)\n")
        case 443:
            s.write("\(q.count)\n")
        case 559:
            s.write("\(q.isEmpty ? 1 : 0)\n")
        case 553:
            s.write("\(q.first ?? -1)\n")
        case 401:
            s.write("\(q.last ?? -1)\n")
        default: break
        }
    }
    
    print(s)

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

    final class IO {
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
 [주의]
 - 입력 시간초과 발생문제
 - FileIO 1도 시간초과 발생하므로 FileIO 2를 써야함
 - print문 대신 String.write(...)
 - 방법 1에서 last 주의 (상단 코멘트 참고)
 - 방법 2에서 count가 0 미만으로 떨어지지 않도록 주의 (상단 코멘트 참고)
 
 큐 2 https://www.acmicpc.net/problem/18258
 
 정수를 저장하는 큐를 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.

 명령은 총 여섯 가지이다.

 push X: 정수 X를 큐에 넣는 연산이다.
 pop: 큐에서 가장 앞에 있는 정수를 빼고, 그 수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 size: 큐에 들어있는 정수의 개수를 출력한다.
 empty: 큐가 비어있으면 1, 아니면 0을 출력한다.
 front: 큐의 가장 앞에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 back: 큐의 가장 뒤에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 입력
 첫째 줄에 주어지는 명령의 수 N (1 ≤ N ≤ 2,000,000)이 주어진다. 둘째 줄부터 N개의 줄에는 명령이 하나씩 주어진다. 주어지는 정수는 1보다 크거나 같고, 100,000보다 작거나 같다. 문제에 나와있지 않은 명령이 주어지는 경우는 없다.

 출력
 출력해야하는 명령이 주어질 때마다, 한 줄에 하나씩 출력한다.
 
 예제 입력 1
15
push 1
push 2
front
back
size
empty
pop
pop
pop
size
empty
pop
push 3
empty
front
 
 예제 출력 1
 1
 2
 2
 0
 1
 2
 -1
 0
 1
 -1
 0
 3
 */
