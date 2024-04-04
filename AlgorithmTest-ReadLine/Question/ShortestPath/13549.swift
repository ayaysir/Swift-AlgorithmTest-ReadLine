//
//  13549.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/3/2024.
//
//  3: 숨바꼭질 3 https://www.acmicpc.net/problem/13549
//

import Foundation

/// 숨바꼭질 3 https://www.acmicpc.net/problem/13549
/// - 다익스트라 70292KB    80ms
func Q_13549() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (r[0], r[1])
    
    func isValid(_ x: Int) -> Bool {
        0...100000 ~= x
    }
    
    if n >= k {
        print(n - k)
    } else {
        var times = [Int](repeating: .max, count: 100001)
        times[n] = 0
        let pq = PriorityQueue<Node>()
        pq.enqueue(.init(time: 0, number: n))
        
        while !pq.isEmpty {
            let pop = pq.dequeue()!
            
            // 이거 없으면 시간 80 -> 188ms로 증가
            if pop.number == k {
                break
            }
            
            if times[pop.number] < pop.time {
                continue
            }
            
            for np in [pop.number + 1, pop.number - 1, pop.number * 2] {
                let nextTime = (np == pop.number * 2) ? 0 : 1
                
                if isValid(np), times[np] > pop.time + nextTime {
                    times[np] = pop.time + nextTime
                    pq.enqueue(.init(time: times[np], number: np))
                }
            }
        }
        
        print(times[k])
    }
    
    struct Node: Comparable {
        static func < (lhs: Node, rhs: Node) -> Bool {
            lhs.time < rhs.time
        }
        
        var time: Int
        var number: Int
    }
    
    /// 최소 힙을 이용한 우선순위 큐 구조체 (난독화)
    class PriorityQueue<T:Comparable>{var q:[T]=[];var isEmpty:Bool{q.isEmpty};var count:Int{q.count};func enqueue(_ e:T){q.append(e);U()};func dequeue()->T?{guard !isEmpty else{return nil};q.swapAt(0,count-1);let d=q.removeLast();D();return d};func L(_ i:Int)->Int{2*i+1};func R(_ i:Int)->Int{2*i+2};func P(_ i:Int)->Int{i>0 ?((i-1)/2):0};func U(){var c=count-1,s=P(c);while c>0&&q[c]<q[s]{q.swapAt(c,s);c=s;s=P(c)}}; func D(){var c=0;while true{let l=L(c),r=R(c);var m=c;if l<count&&q[l]<q[m]{m=l};if r<count&&q[r]<q[m]{m=r};if m==c{break};q.swapAt(c,m);c=m}}}
}

/// 숨바꼭질 3 https://www.acmicpc.net/problem/13549
/// - BFS 73016KB    16ms
func Q_13549_BFS() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (r[0], r[1])
    
    func isValid(_ x: Int) -> Bool {
        0...100000 ~= x
    }
    
    if n >= k {
        print(n - k)
    } else {
        var visited = [Int](repeating: .max, count: 100001)
        var q = [(p: n, t: 0)], sIdx = 0
        while sIdx < q.count {
            let pop = q[sIdx]
            sIdx += 1
            
            for np in [pop.p - 1, pop.p + 1, pop.p * 2] {
                let nt = (np == pop.p * 2) ? pop.t : pop.t + 1
                
                if isValid(np), visited[np] > nt {
                    visited[np] = nt
                    q.append((np, nt))
                }
            }
        }
        
        print(visited[k])
    }
}

/*
 문제
 수빈이는 동생과 숨바꼭질을 하고 있다. 수빈이는 현재 점 N(0 ≤ N ≤ 100,000)에 있고, 동생은 점 K(0 ≤ K ≤ 100,000)에 있다. 수빈이는 걷거나 순간이동을 할 수 있다. 만약, 수빈이의 위치가 X일 때 걷는다면 1초 후에 X-1 또는 X+1로 이동하게 된다. 순간이동을 하는 경우에는 0초 후에 2*X의 위치로 이동하게 된다.

 수빈이와 동생의 위치가 주어졌을 때, 수빈이가 동생을 찾을 수 있는 가장 빠른 시간이 몇 초 후인지 구하는 프로그램을 작성하시오.

 입력
 첫 번째 줄에 수빈이가 있는 위치 N과 동생이 있는 위치 K가 주어진다. N과 K는 정수이다.

 출력
 수빈이가 동생을 찾는 가장 빠른 시간을 출력한다.

 예제 입력 1
 5 17
 
 예제 출력 1
 2
 
 힌트
 수빈이가 5-10-9-18-17 순으로 가면 2초만에 동생을 찾을 수 있다.
 */
