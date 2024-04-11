//
//  1916.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/11/24.
//

import Foundation

/// 최소비용 구하기 1916
func Q_1916() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var graph: [[Node]] = .init(repeating: [], count: n + 1)
    var weights = Array(repeating: Int.max, count: n + 1)
    let pq = PriorityQueue<Node>()
    
    for _ in 0..<m {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        // u에서 v로 가는 가중치 w인 간선
        let (u, v, w) = (r[0], r[1], r[2])
        graph[u].append(Node(w: w, n: v))
    }
    
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, end) = (r[0], r[1])
    
    weights[start] = 0
    pq.enqueue(.init(w: 0, n: start))
    
    while !pq.isEmpty {
        let pop = pq.dequeue()!
        
        if pop.n == end {
            break
        }
        
        if weights[pop.n] < pop.w {
            continue
        }
        
        for i in graph[pop.n].indices {
            let next = graph[pop.n][i]
            
            if weights[next.n] > pop.w + next.w {
                weights[next.n] = pop.w + next.w
                pq.enqueue(.init(w: weights[next.n], n: next.n))
            }
        }
    }
    
    print(weights[end])
    
    struct Node: Comparable { static func < (lhs: Node, rhs: Node) -> Bool { lhs.w < rhs.w }; var w, n: Int }
    
    /// 최소 힙을 이용한 우선순위 큐 구조체 (난독화)
    class PriorityQueue<T:Comparable>{var q:[T]=[];var isEmpty:Bool{q.isEmpty};var count:Int{q.count};func enqueue(_ e:T){q.append(e);U()};func dequeue()->T?{guard !isEmpty else{return nil};q.swapAt(0,count-1);let d=q.removeLast();D();return d};func L(_ i:Int)->Int{2*i+1};func R(_ i:Int)->Int{2*i+2};func P(_ i:Int)->Int{i>0 ?((i-1)/2):0};func U(){var c=count-1,s=P(c);while c>0&&q[c]<q[s]{q.swapAt(c,s);c=s;s=P(c)}}; func D(){var c=0;while true{let l=L(c),r=R(c);var m=c;if l<count&&q[l]<q[m]{m=l};if r<count&&q[r]<q[m]{m=r};if m==c{break};q.swapAt(c,m);c=m}}}
}

/*
 [💥💥💥]
 - 시간 초과 발생: 목적지가 있는 경우 (pop.n == end) break로 끊어준다.
 
 [풀이]
 - 다익스트라 문제
 - 문제에서 언급이 없으면 방향이 있는 그래프(방향그래프)로 먼저 간주하고 풀어본다.
 
 ----------
 
 문제
 N개의 도시가 있다. 그리고 한 도시에서 출발하여 다른 도시에 도착하는 M개의 버스가 있다. 우리는 A번째 도시에서 B번째 도시까지 가는데 드는 버스 비용을 최소화 시키려고 한다. A번째 도시에서 B번째 도시까지 가는데 드는 최소비용을 출력하여라. 도시의 번호는 1부터 N까지이다.

 입력
 첫째 줄에 도시의 개수 N(1 ≤ N ≤ 1,000)이 주어지고 둘째 줄에는 버스의 개수 M(1 ≤ M ≤ 100,000)이 주어진다. 그리고 셋째 줄부터 M+2줄까지 다음과 같은 버스의 정보가 주어진다. 먼저 처음에는 그 버스의 출발 도시의 번호가 주어진다. 그리고 그 다음에는 도착지의 도시 번호가 주어지고 또 그 버스 비용이 주어진다. 버스 비용은 0보다 크거나 같고, 100,000보다 작은 정수이다.

 그리고 M+3째 줄에는 우리가 구하고자 하는 구간 출발점의 도시번호와 도착점의 도시번호가 주어진다. 출발점에서 도착점을 갈 수 있는 경우만 입력으로 주어진다.

 출력
 첫째 줄에 출발 도시에서 도착 도시까지 가는데 드는 최소 비용을 출력한다.

 예제 입력 1
 5
 8
 1 2 2
 1 3 3
 1 4 1
 1 5 10
 2 4 2
 3 4 1
 3 5 1
 4 5 3
 1 5
 
 예제 출력 1
 4
 
 [반례]
5
4
1 2 1
2 3 1
1 4 1
4 5 1
1 5
 ans: 2
 
5
5
1 2 1
2 3 2
2 4 1
3 5 1
4 5 3
1 5
 answer : 4
 
4
3
1 3 0
3 2 0
2 4 0
1 4
 answer : 0
 
2
2
1 2 0
1 2 10
1 2
 answer : 0
 
2
3
1 2 5
1 2 10
1 2 3
1 2
 answer : 3
 
1
1
1 1 1
1 1
 answer : 0
 
4
6
1 2 1
1 4 5
1 3 3
2 4 2
2 3 1
3 4 1
1 4
 answer : 3
 
4
5
1 2 10
1 4 5
4 2 1
2 3 1
4 3 10
1 3
 answer : 7
 */
