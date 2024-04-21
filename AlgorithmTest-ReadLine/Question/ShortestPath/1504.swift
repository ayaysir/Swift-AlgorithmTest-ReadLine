//
//  1504.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/3/2024.
//
//  2: 특정한 최단 경로 https://www.acmicpc.net/problem/1504
//

import Foundation

/// 특정한 최단 경로 https://www.acmicpc.net/problem/1504
func Q_1504() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, e) = (r[0], r[1])
    var graph = Array(repeating: [Node](), count: n + 1)
    var dist = Array(repeating: Int.max, count: n + 1)
    
    for _ in 0..<e {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (u, v, w) = (r[0], r[1], r[2])
        graph[u].append(.init(weight: w, number: v))
        graph[v].append(.init(weight: w, number: u))
    }
    
    let ps = readLine()!.split(separator: " ").map { Int($0)! }
    
    func dijkstra(_ k: Int) {
        dist = Array(repeating: Int.max, count: n + 1)
        let pq = PriorityQueue<Node>()
        
        dist[k] = 0
        pq.enqueue(.init(weight: 0, number: k))
        
        while !pq.isEmpty {
            let pop = pq.dequeue()!
            
            // 현재 노드가 이미 처리된 적이 있는 노드라면 무시
            // => 처리가 되면 거리가 줄어들어야 함
            if dist[pop.number] < pop.weight {
                continue
            }
            
            for i in graph[pop.number].indices {
                let next = graph[pop.number][i]
                
                if dist[next.number] > pop.weight + next.weight {
                    dist[next.number] = pop.weight + next.weight
                    pq.enqueue(.init(weight: dist[next.number], number: next.number))
                }
            }
        }
    }
    
    /// MAX_DIST랑 같다면 nil, 아니면 숫자를 반환
    func sumIncludeInfinity(_ args: Int...) -> Int {
        args.max() == .max ? .max : args.reduce(0, +)
    }
    
    dijkstra(1)
    let sToV1 = dist[ps[0]]
    let sToV2 = dist[ps[1]]
    
    dijkstra(ps[0])
    let v1ToV2 = dist[ps[1]] // V1 -> V2와 V2 -> V1의 결과는 같음
    let v1ToE = dist[n]
    
    if v1ToV2 == .max {
        print(-1)
    } else {
        dijkstra(ps[1])
        let v2ToE = dist[n]
        
        let pathA = sumIncludeInfinity(sToV1, v1ToV2, v2ToE)
        let pathB = sumIncludeInfinity(sToV2, v1ToV2, v1ToE)
        let result = min(pathA, pathB)
        
        print(result == .max ? -1 : result)
    }
    
    struct Node: Comparable {
        static func < (lhs: Node, rhs: Node) -> Bool {
            lhs.weight < rhs.weight
        }
        
        var weight: Int
        var number: Int
    }
    
    /// 최소 힙을 이용한 우선순위 큐 구조체 (난독화)
    class PriorityQueue<T:Comparable>{var q:[T]=[];var isEmpty:Bool{q.isEmpty};var count:Int{q.count};func enqueue(_ e:T){q.append(e);U()};func dequeue()->T?{guard !isEmpty else{return nil};q.swapAt(0,count-1);let d=q.removeLast();D();return d};func L(_ i:Int)->Int{2*i+1};func R(_ i:Int)->Int{2*i+2};func P(_ i:Int)->Int{i>0 ?((i-1)/2):0};func U(){var c=count-1,s=P(c);while c>0&&q[c]<q[s]{q.swapAt(c,s);c=s;s=P(c)}}; func D(){var c=0;while true{let l=L(c),r=R(c);var m=c;if l<count&&q[l]<q[m]{m=l};if r<count&&q[r]<q[m]{m=r};if m==c{break};q.swapAt(c,m);c=m}}}
}

/*
 [틀린 이유]
 (1) "방향성이 없는 그래프"는 방형 그래프와 다르다.
  - 기본문제 1753에서는 그래프 데이터를 추가할 때 단방향으로만 넣었지만 (u -> v)
  - 이번 문제에서는 "방향성이 없는 그래프"라 하였으므로 양방향으로 넣어야 한다. (u -> v, v -> u)
 (2) v1ToV2가 무한대(=>Int.max)이면 답은 무조건 -1이고, 그게 아니더라도 답이 무한대인 경우가 있다.
 (3) Int.max는 무한대가 아니라 Int의 최대값이므로 연산에 따라 산술 오버플로 런타임 에러가 발생할 수 있다.
  - 일단 이번문제는 덧셈의 최대값을 Int.max로 고정하도록 했고, 더 좋은 방법을 찾아볼 예정
 
 [풀이] https://chosh95.tistory.com/419
 - 방문 경로
  * start -> v1 -> v2 -> N
  * start -> v2 -> v1 -> N
 - 다익스트라 함수를 총 3번 실행한다.
  (1) start -> v1 과 start -> v2 까지의 거리를 구하기 위한 다익스트라
  (2) v1 -> v2를 구하기 위한 다익스트라 및 v1 -> N
      - 양방향(=>방향성이 없음)이므로 v2 -> v1를 따로 구하지 않아도 된다.
  (3) v2 -> N을 구하기 위한 다익스트라.
 - v1 -> v2가 INF라면 무조건 정답이 없기 때문에 바로 -1을 출력
 - 아니라면 두 경로 중 짧은 경로를 출력하되, 그 짧은 경로가 무한대가 나올 수 있으므로 여기에 대해서도 처리.
 
 --------
 
 문제
 방향성이 없는 그래프가 주어진다. 세준이는 1번 정점에서 N번 정점으로 최단 거리로 이동하려고 한다. 또한 세준이는 두 가지 조건을 만족하면서 이동하는 특정한 최단 경로를 구하고 싶은데, 그것은 바로 임의로 주어진 두 정점은 반드시 통과해야 한다는 것이다.

 세준이는 한번 이동했던 정점은 물론, 한번 이동했던 간선도 다시 이동할 수 있다. 하지만 반드시 최단 경로로 이동해야 한다는 사실에 주의하라. 1번 정점에서 N번 정점으로 이동할 때, 주어진 두 정점을 반드시 거치면서 최단 경로로 이동하는 프로그램을 작성하시오.

 입력
 첫째 줄에 정점의 개수 N과 간선의 개수 E가 주어진다. (2 ≤ N ≤ 800, 0 ≤ E ≤ 200,000) 둘째 줄부터 E개의 줄에 걸쳐서 세 개의 정수 a, b, c가 주어지는데, a번 정점에서 b번 정점까지 양방향 길이 존재하며, 그 거리가 c라는 뜻이다. (1 ≤ c ≤ 1,000) 다음 줄에는 반드시 거쳐야 하는 두 개의 서로 다른 정점 번호 v1과 v2가 주어진다. (v1 ≠ v2, v1 ≠ N, v2 ≠ 1) 임의의 두 정점 u와 v사이에는 간선이 최대 1개 존재한다.

 출력
 첫째 줄에 두 개의 정점을 지나는 최단 경로의 길이를 출력한다. 그러한 경로가 없을 때에는 -1을 출력한다.

 예제 입력 1
 4 6
 1 2 3
 2 3 3
 3 4 1
 1 3 5
 2 4 5
 1 4 4
 2 3
 
 예제 출력 1
 7
 
 ----------
 [반례]
 
 input
4 3
1 2 1
2 3 1
3 4 1
1 4

 ans
 3
 
 input
2 0
1 2

 ans
 -1
 
 input
8 10
1 2 100
2 3 100
1 3 10
3 4 100
4 8 1000
1 5 100
5 6 100
1 6 10
6 7 100
7 8 1000
4 7

 ans
 1330

 input
4 3
1 2 1
1 3 10
2 4 1
2 3

 ans
 22
 
 input
4 5
1 2 100
1 3 1
2 3 1
2 4 10
3 4 1
1 2

 ans
 4
 
 input
 4 2
 2 3 2
 3 4 2
 2 3

 ans
 -1

 input
 4 1
 1 2 2
 2 3

 ans
 -1
 
 input
 4 0
 2 3

 ans
 -1
 
 input
 4 6
 1 2 3
 2 3 3
 3 4 1
 1 3 5
 2 4 5
 1 4 4
 1 4

 ans
 4
 
 input
 4 5
 1 2 100
 1 3 1
 2 3 1
 2 4 10
 3 4 1
 1 2

 ans
 4
 
 input

 4 6
 1 2 3
 2 3 3
 3 4 1
 1 3 5
 2 4 5
 1 4 4
 2 3

 ans
 7
 
 input

 4 5
 1 2 3
 1 3 1
 1 4 1
 2 3 3
 3 4 4
 2 3

 ans
 8
 
 input

 5 6
 1 2 3
 1 3 1
 1 4 1
 2 3 3
 3 4 4
 4 5 1
 2 3

 ans
 9
 */
