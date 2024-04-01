//
//  24445.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/31/2024.
//
//  4: 알고리즘 수업 - 너비 우선 탐색 2 https://www.acmicpc.net/problem/24445
//

import Foundation

/// 알고리즘 수업 - 너비 우선 탐색 2 https://www.acmicpc.net/problem/24445
func Q_24445() { 
    let cmd = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m, r) = (cmd[0], cmd[1], cmd[2])
    var graphs = [Int : [Int]]()
    var visited = Array(repeating: 0, count: n + 1)
    var q = Queue<Int>()
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        graphs[input[0], default: []].append(input[1])
        graphs[input[1], default: []].append(input[0])
    }
    
    var count = 1
    
    func bfs(_ r: Int) {
        visited[r] = count
        q.enqueue(r)
        
        while !q.isEmpty, let dq = q.dequeue() {
            for v in graphs[dq, default: []].sorted(by: >) where visited[v] == 0 {
                count += 1
                visited[v] = count
                q.enqueue(v)
            }
        }
    }
    
    bfs(r)
    
    var result = ""
    for i in 1...n {
        result.write("\(visited[i])\n")
    }
    
    print(result)
    
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
}
