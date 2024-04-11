//
//  11779.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/8/2024.
//
//  8: 최소비용 구하기 2 https://www.acmicpc.net/problem/11779
//

import Foundation

/// 최소비용 구하기 2 https://www.acmicpc.net/problem/11779
func Q_11779() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    let pq = PriorityQueue<Node>()
    var graph: [[Node]] = .init(repeating: [], count: n + 1)
    var weights = Array(repeating: Int.max, count: n + 1)
    var prevs = Array(repeating: -1, count: n + 1)
    
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
                prevs[next.n] = pop.n
            }
        }
    }
    
    var i = end, paths = ["\(end)"]
    while i != start {
        paths.append("\(prevs[i])")
        i = prevs[i]
    }
    
    print(weights[end])
    print(paths.count)
    print(paths.reversed().joined(separator: " "))
    
    struct Node: Comparable { static func < (lhs: Node, rhs: Node) -> Bool { lhs.w < rhs.w }; var w, n: Int }
    
    /// 최소 힙을 이용한 우선순위 큐 구조체 (난독화)
    class PriorityQueue<T:Comparable>{var q:[T]=[];var isEmpty:Bool{q.isEmpty};var count:Int{q.count};func enqueue(_ e:T){q.append(e);U()};func dequeue()->T?{guard !isEmpty else{return nil};q.swapAt(0,count-1);let d=q.removeLast();D();return d};func L(_ i:Int)->Int{2*i+1};func R(_ i:Int)->Int{2*i+2};func P(_ i:Int)->Int{i>0 ?((i-1)/2):0};func U(){var c=count-1,s=P(c);while c>0&&q[c]<q[s]{q.swapAt(c,s);c=s;s=P(c)}}; func D(){var c=0;while true{let l=L(c),r=R(c);var m=c;if l<count&&q[l]<q[m]{m=l};if r<count&&q[r]<q[m]{m=r};if m==c{break};q.swapAt(c,m);c=m}}}
}

/*
 [풀이] https://ko.wikipedia.org/wiki/데이크스트라_알고리즘#우선순위_큐_사용
 - 1916번 문제 (최소비용 구하기)에서 경로 추적이 추가됨
 - prevs 배열을 만들고 우선순위 큐에 enqueue할 때마다 이전 경로를 추가
  => prevs[next.n] = pop.n => prevs[다음경로] = 현재경로
 - prevs[end] 로부터 start 까지 역탐색 후 배열 뒤집어서 출력
 - 링크의 의사 코드 참조
 
 ---------
 
 문제
 n(1≤n≤1,000)개의 도시가 있다. 그리고 한 도시에서 출발하여 다른 도시에 도착하는 m(1≤m≤100,000)개의 버스가 있다. 우리는 A번째 도시에서 B번째 도시까지 가는데 드는 버스 비용을 최소화 시키려고 한다. 그러면 A번째 도시에서 B번째 도시 까지 가는데 드는 최소비용과 경로를 출력하여라. 항상 시작점에서 도착점으로의 경로가 존재한다.

 입력
 첫째 줄에 도시의 개수 n(1≤n≤1,000)이 주어지고 둘째 줄에는 버스의 개수 m(1≤m≤100,000)이 주어진다. 그리고 셋째 줄부터 m+2줄까지 다음과 같은 버스의 정보가 주어진다. 먼저 처음에는 그 버스의 출발 도시의 번호가 주어진다. 그리고 그 다음에는 도착지의 도시 번호가 주어지고 또 그 버스 비용이 주어진다. 버스 비용은 0보다 크거나 같고, 100,000보다 작은 정수이다.

 그리고 m+3째 줄에는 우리가 구하고자 하는 구간 출발점의 도시번호와 도착점의 도시번호가 주어진다.

 출력
 첫째 줄에 출발 도시에서 도착 도시까지 가는데 드는 최소 비용을 출력한다.

 둘째 줄에는 그러한 최소 비용을 갖는 경로에 포함되어있는 도시의 개수를 출력한다. 출발 도시와 도착 도시도 포함한다.

 셋째 줄에는 최소 비용을 갖는 경로를 방문하는 도시 순서대로 출력한다.

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
 3
 1 3 5
 */
