//
//  1753.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/12/18.
//

import Foundation

/*
 PriorityQueue: GPT가 만들어줌
 문제풀이: https://dy-coding.tistory.com/entry/백준-1753번-최단경로-java
 */

/// 최단경로 https://www.acmicpc.net/problem/1753
func Q_1753() {
    struct Node: Comparable {
        static func < (lhs: Node, rhs: Node) -> Bool {
            lhs.weight < rhs.weight
        }
        
        var weight: Int
        var number: Int
    }
    
    let r: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let (v, e) = (r[0], r[1])
    let k = Int(readLine()!)! // 시작 정점의 번호
    
    // weight = distance 같다고 봐도 무방
    var dist = [Int](repeating: .max, count: v + 1)
    var graph: [[Node]] = .init(repeating: [], count: v + 1)
    var pq = PriorityQueue<Node>()
    
    for _ in 0..<e {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        // u에서 v로 가는 가중치 w인 간선
        let (u, v, w) = (r[0], r[1], r[2])
        graph[u].append(Node(weight: w, number: v))
    }
    
    // dijkstra
    dist[k] = 0
    pq.enqueue(Node(weight: 0, number: k))
    
    while !pq.isEmpty {
        let pop = pq.dequeue()!
        
        // 현재 노드가 이미 처리된 적이 있는 노드라면 무시
        // => 처리가 되면 거리가 줄어들어야 함
        if dist[pop.number] < pop.weight {
            continue
        }
        
        // graph[pop.number]의 카운트만큼 i를 돌림 (graph[x][i]는 0부터 시작)
        // 따라서 0..<count 로 해야하고 1은 안된다.
        for i in graph[pop.number].indices {
            let next = graph[pop.number][i]
            
            // 현재 노드를 거쳐서 다른 노드로 이동하는 거리가 더 짧은 경우
            if dist[next.number] > pop.weight + next.weight {
                dist[next.number] = pop.weight + next.weight
                pq.enqueue(Node(weight: dist[next.number], number: next.number))
            }
        }
    }
    
    print(dist[1...].map { $0 == .max ? "INF" : "\($0)" }.joined(separator: "\n"))
}

/*
 [풀이]
 - 방향성이 있는 그래프(방향그래프)이므로 그래프에 데이트를 추가할 때 한 번만 넣는다. (u -> v)
 - 만약 무방향 그래프라면 양쪽에 전부 넣어줘야 한다. (u -> v, v -> u)
 
 [우선순위 큐를 사용한 Pseudocode]
 
 1  function Dijkstra(Graph, source):
 2      dist[source] ← 0                           // 초기화
 3
 4      create vertex set Q
 5
 6      for each vertex v in Graph:
 7          if v ≠ source
 8              dist[v] ← INFINITY                 // 소스에서 v까지의 아직 모르는 길이
 9          prev[v] ← UNDEFINED                    // v의 이전 노드
 10
 11         Q.add_with_priority(v, dist[v])
 12
 13
 14     while Q is not empty:                      // 메인 루프
 15         u ← Q.extract_min()                    // 최고의 꼭짓점을 제거하고 반환한다
 16         for each neighbor v of u:              // Q에 여전히 남아 있는 v에 대해서만
 17             alt ← dist[u] + length(u, v)
 18             if alt < dist[v]
 19                 dist[v] ← alt
 20                 prev[v] ← u
 21                 Q.decrease_priority(v, alt)
 22
 23     return dist, prev
 
 ---------
 
 문제
 방향그래프가 주어지면 주어진 시작점에서 다른 모든 정점으로의 최단 경로를 구하는 프로그램을 작성하시오. 단, 모든 간선의 가중치는 10 이하의 자연수이다.

 입력
 첫째 줄에 정점의 개수 V와 간선의 개수 E가 주어진다. (1 ≤ V ≤ 20,000, 1 ≤ E ≤ 300,000) 모든 정점에는 1부터 V까지 번호가 매겨져 있다고 가정한다. 둘째 줄에는 시작 정점의 번호 K(1 ≤ K ≤ V)가 주어진다. 셋째 줄부터 E개의 줄에 걸쳐 각 간선을 나타내는 세 개의 정수 (u, v, w)가 순서대로 주어진다. 이는 u에서 v로 가는 가중치 w인 간선이 존재한다는 뜻이다. u와 v는 서로 다르며 w는 10 이하의 자연수이다. 서로 다른 두 정점 사이에 여러 개의 간선이 존재할 수도 있음에 유의한다.

 출력
 첫째 줄부터 V개의 줄에 걸쳐, i번째 줄에 i번 정점으로의 최단 경로의 경로값을 출력한다. 시작점 자신은 0으로 출력하고, 경로가 존재하지 않는 경우에는 INF를 출력하면 된다.

 예제 입력 1
5 6
1
5 1 1
1 2 2
1 3 3
2 3 4
2 4 5
3 4 6
 
 예제 출력 1
 0
 2
 3
 7
 INF
 */
