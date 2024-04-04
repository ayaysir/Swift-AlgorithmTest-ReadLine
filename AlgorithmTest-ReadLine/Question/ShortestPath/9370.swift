//
//  9370.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/3/2024.
//
//  4: 미확인 도착지 https://www.acmicpc.net/problem/9370
//

// import Foundation

/// 미확인 도착지 https://www.acmicpc.net/problem/9370
func Q_9370() {
    func dijkstra(_ k: Int, _ graph: [[Node]]) -> [Int] {
        var dists = Array(repeating: Int.max, count: graph.count)
        dists[k] = 0
        
        let pq = PriorityQueue<Node>()
        pq.enqueue(.init(weight: 0, number: k))
        
        while !pq.isEmpty {
            let pop = pq.dequeue()!
            
            if dists[pop.number] < pop.weight {
                continue
            }
            
            for i in graph[pop.number].indices {
                let next = graph[pop.number][i]
                
                if dists[next.number] > pop.weight + next.weight {
                    dists[next.number] = pop.weight + next.weight
                    pq.enqueue(.init(weight: dists[next.number], number: next.number))
                }
            }
        }
        
        return dists
    }
    
    func sumIncludeInfinity(_ args: Int...) -> Int {
        args.max() == .max ? .max : args.reduce(0, +)
    }
    
    for _ in 0..<Int(readLine()!)! {
        let nmt = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, m, t) = (nmt[0], nmt[1], nmt[2])
        let sgh = readLine()!.split(separator: " ").map { Int($0)! }
        let (s, g, h) = (sgh[0], sgh[1], sgh[2])
        
        var graph = Array(repeating: [Node](), count: n + 1)
        var dests = [Int]()
        var results = [Int]()
        
        for _ in 0..<m {
            let r = readLine()!.split(separator: " ").map { Int($0)! }
            let (a, b, d) = (r[0], r[1], r[2])
            graph[a].append(.init(weight: d, number: b))
            graph[b].append(.init(weight: d, number: a))
        }
        
        for _ in 0..<t {
            dests.append(Int(readLine()!)!)
        }
        
        let dists_s = dijkstra(s, graph)
        let dists_g = dijkstra(g, graph)
        let dists_h = dijkstra(h, graph)
        
        for i in dests.indices {
            // 무방향 그래프이므로 dists_h[g], dists_g[h]의 값은 사실 같음
            let sghx = dists_s[dests[i]] == sumIncludeInfinity(dists_s[g], dists_g[h], dists_h[dests[i]])
            let shgx = dists_s[dests[i]] == sumIncludeInfinity(dists_s[h], dists_h[g], dists_g[dests[i]])
            
            // 만약 시작점에서 목적지로 못가는 경우 INF일 텐데, 만약 이 상황에서
            // G -> 목적지 가 INF거나 H -> 목적지가 INF일 경우 INF = INF + INF 가 성립
            // => 시작점부터 목적지가 무한대라면 정답이 아님
            if dists_s[dests[i]] != .max, (sghx || shgx) {
                results.append(dests[i])
            }
        }
        
        print(results.sorted().map(String.init).joined(separator: " "))
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
 [문제해석]
 - s에서 시작해서 g, h를 반드시 들른 후 목적지(여러 개)에 도착했을 때
   "그들이 g와 h 교차로 사이에 있는 도로를 지나갔다는 것을 알아냈다."
 - 그 목적지에 도착한게 최단거리인 경우 정답에 표시, 아니면 표시하지마 (여러개인 경우 오름차순으로)
   "목적지까지 우회하지 않고 최단거리로 갈 것이라 확신한다."
 
 [풀이] https://mgyo.tistory.com/776
  - 특정한 최단 경로(1504)와 비슷한 문제
  - 가능한 경로
   * S -> G -> H -> X
   * S -> H -> G -> X
  - S -> (G/H) -> (G -> H == H -> G) -> X의 거리를 구한 뒤
  - 그게 S -> X로 다이렉트로 갔을 때의 최단거리와 같다면 정답
 
 [주의]
  (1) 무한대가 문제 풀이에서 필요한 경우 Int 타입 사용 주의
   - Int.max는 무한대가 아니므로 런타임 에러 발생
   - 자료 타입을 바꾸기보단 더 좋은 방법을 생각해볼 것
  (2) dists_s[dests[i]] != .max, (sghx || shgx)
   - 만약 시작점에서 목적지로 못가는 경우 INF일 텐데, 만약 이 상황에서
   - G -> 목적지 가 INF거나 H -> 목적지가 INF일 경우 INF = INF + INF 가 성립
   => 시작점부터 목적지가 무한대라면 정답이 아님 (dists_s[dests[i]] != .max)
  
 ----------
 입력
 첫 번째 줄에는 테스트 케이스의 T(1 ≤ T ≤ 100)가 주어진다. 각 테스트 케이스마다

 첫 번째 줄에 3개의 정수 n, m, t (2 ≤ n ≤ 2 000, 1 ≤ m ≤ 50 000 and 1 ≤ t ≤ 100)가 주어진다. 각각 교차로, 도로, 목적지 후보의 개수이다.
 두 번째 줄에 3개의 정수 s, g, h (1 ≤ s, g, h ≤ n)가 주어진다. s는 예술가들의 출발지이고, g, h는 문제 설명에 나와 있다. (g ≠ h)
 그 다음 m개의 각 줄마다 3개의 정수 a, b, d (1 ≤ a < b ≤ n and 1 ≤ d ≤ 1 000)가 주어진다. a와 b 사이에 길이 d의 양방향 도로가 있다는 뜻이다.
 그 다음 t개의 각 줄마다 정수 x가 주어지는데, t개의 목적지 후보들을 의미한다. 이 t개의 지점들은 서로 다른 위치이며 모두 s와 같지 않다.
 교차로 사이에는 도로가 많아봐야 1개이다. m개의 줄 중에서 g와 h 사이의 도로를 나타낸 것이 존재한다. 또한 이 도로는 목적지 후보들 중 적어도 1개로 향하는 최단 경로의 일부이다.

 출력
 테스트 케이스마다 입력에서 주어진 목적지 후보들 중 불가능한 경우들을 제외한 목적지들을 공백으로 분리시킨 오름차순의 정수들로 출력한다.
 
 예제 입력 1
 2
 5 4 2
 1 2 3
 1 2 6
 2 3 2
 3 4 4
 3 5 3
 5
 4
 6 9 2
 2 3 1
 1 2 1
 1 3 3
 2 4 4
 2 5 5
 3 4 3
 3 6 2
 4 5 4
 4 6 3
 5 6 7
 5
 6
 
 예제 출력 1
 4 5
 6
 */
