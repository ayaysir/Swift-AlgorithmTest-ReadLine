//
//  4386.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/20/2024.
//
//  3: 별자리 만들기 https://www.acmicpc.net/problem/4386
//

import Foundation

/// 별자리 만들기 https://www.acmicpc.net/problem/4386
/// - 크루스칼 알고리즘 79916KB    12ms
func Q_4386_() {
    // import Foundation
    
    typealias Coord = (x: Double, y: Double)
    typealias Edge = (weight: Double, from: Int, to: Int)
    
    func euclideanDistance(_ a: Coord, _ b: Coord) -> Double {
        sqrt(pow(b.x - a.x, 2) + pow(b.y - a.y, 2))
    }
    
    let n = Int(readLine()!)!
    let coords: [Coord] = (0..<n).map { _ in
        let values = readLine()!.split(separator: " ").map { Double($0)! }
        return (values[0], values[1])
    }
    
    let edges: [Edge] = {
        var array = [Edge]()
        
        for i in 0..<coords.count {
            for j in i + 1..<coords.count {
                let dist = euclideanDistance(coords[i], coords[j])
                array.append((dist, i, j))
            }
        }
        
        return array.sorted(by: { $0.weight < $1.weight })
    }()
    
    // print(edges)
    
    var unf = Array(0...n)
    
    func find(_ x: Int) -> Int {
        guard unf[x] != x else {
            return x
        }
        
        unf[x] = find(unf[x])
        return unf[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let (x, y) = (find(x), find(y))
        
        guard x != y else {
            return
        }
        
        unf[y] = x
    }
    
    var wSum: Double = 0.0
    
    func hasSameParent(edge: Edge) -> Bool {
        find(edge.from) == find(edge.to)
    }
    
    for i in 0..<edges.count where !hasSameParent(edge: edges[i]) {
        union(edges[i].from, edges[i].to)
        wSum += edges[i].weight
    }
    
    let digit: Double = pow(10, 2)
    print(round(wSum * digit) / digit)
}

/// 별자리 만들기 https://www.acmicpc.net/problem/4386
/// - 프림 알고리즘 80160KB    104ms
func Q_4386() {
    // import Foundation
    
    typealias Coord = (x: Double, y: Double)
    struct Node: Comparable {
        static func < (lhs: Node, rhs: Node) -> Bool {
            lhs.weight < rhs.weight
        }
        
        var weight: Double
        var number: Int
    }
    
    func euclideanDistance(_ a: Coord, _ b: Coord) -> Double {
        sqrt(pow(b.x - a.x, 2) + pow(b.y - a.y, 2))
    }
    
    let n = Int(readLine()!)!
    let coords: [Coord] = (0..<n).map { _ in
        let values = readLine()!.split(separator: " ").map { Double($0)! }
        return (values[0], values[1])
    }
    
    let nodes: [[Node]] = {
        var array = Array(repeating: [Node](), count: n + 1)
        
        for i in 0..<coords.count {
            for j in i + 1..<coords.count {
                let dist = euclideanDistance(coords[i], coords[j])
                array[i].append(Node(weight: dist, number: j))
                array[j].append(Node(weight: dist, number: i))
            }
        }
        
        return array
    }()
    
    var visited = Array(repeating: false, count: n + 1)
    var wSum: Double = 0.0
    let pq = PriorityQueue<Node>()
    
    for i in 0..<nodes[0].count {
        pq.enqueue(nodes[0][i])
    }
    
    visited[0] = true
    
    while !pq.isEmpty {
        let pop = pq.dequeue()!
        
        if !visited[pop.number] {
            visited[pop.number] = true
            wSum += pop.weight
        }
        
        for i in nodes[pop.number].indices where !visited[nodes[pop.number][i].number] {
            pq.enqueue(nodes[pop.number][i])
        }
    }
    
    let digit: Double = pow(10, 2)
    print(round(wSum * digit) / digit)
    
    /// 최소 힙을 이용한 우선순위 큐 구조체 (난독화)
    class PriorityQueue<T:Comparable>{var q:[T]=[];var isEmpty:Bool{q.isEmpty};var count:Int{q.count};func enqueue(_ e:T){q.append(e);U()};func dequeue()->T?{guard !isEmpty else{return nil};q.swapAt(0,count-1);let d=q.removeLast();D();return d};func L(_ i:Int)->Int{2*i+1};func R(_ i:Int)->Int{2*i+2};func P(_ i:Int)->Int{i>0 ?((i-1)/2):0};func U(){var c=count-1,s=P(c);while c>0&&q[c]<q[s]{q.swapAt(c,s);c=s;s=P(c)}}; func D(){var c=0;while true{let l=L(c),r=R(c);var m=c;if l<count&&q[l]<q[m]{m=l};if r<count&&q[r]<q[m]{m=r};if m==c{break};q.swapAt(c,m);c=m}}}
}

/*
 [풀이]
 (1) 예제 데이터를 분석하면 거리 구하는 방법으로 유클리드 거리를 사용
 ⬜️1️⃣2️⃣3️⃣4️⃣   (1, 1) ~ (2, 2) = 1.41
 1️⃣✴️⬜️⬜️⬜️   (2, 2) ~ (2, 4) = 2
 2️⃣⬜️✴️⬜️⬜️   (1, 1) ~ (2, 4) = 3.16
 3️⃣⬜️⬜️⬜️⬜️
 4️⃣⬜️✴️⬜️⬜️   가장 짧은 직선을 이으면 1.41 + 2 = 3.41
 
 (2) 간선 정보가 주어지지 않았으므로 간선 목록을 직접 생성해야 한다.
  - 좌표 목록을 2중 for문으로 돌면서 두 좌표 간 거리를 계산 => 가중치
  - (가중치, 시작, 끝) 정보를 간선 목록에 추가
 
 (3) 간선 목록을 바탕으로 최소 신장 트리의 가중치를 구함
  - 크루스칼 (간선 중심, 간선이 적을 때 사용 => 1197번 문제) 또는
  - 프림 (정점 중심, 간선이 많을 때 사용) 알고리즘이 있음
  - 두 개 중 하나 선택해서 사용
 
 <참고>
 - 프림의 시간 복잡도는 O(ElogV)
 - 크루스칼의 시간 복잡도는 O(ElogE)
 
 (4) 프림 알고리즘 https://ongveloper.tistory.com/376
  - 다익스트라 알고리즘 구현과 유사
  - 간선 정보 대신 [[Node]] 정보를 추가
    - 어떤 한 노드 번호와 연결된 모든 노드를 탐색하는 과정이 있기 때문에 2차원 배열 사용
    - 우선순위큐를 사용하므로 단순 튜플 사용 불가 => Comparable 준수
  - 방문 여부 배열 생성
  - 제일 첫 노드 번호를 방문한 것으로 하고, PQ 생성 및 탐색
    - 방문하지 않은 경우, 방문 표시하고 최종 결과에 가중치를 더함
    - 그 노드와 연결된 노드 중에서 방문하지 않은 노드가 있는 경우, PQ에 집어넣음
  - 탐색 결과 산출된 가중치가 정답
 
 ------
 
 문제
 도현이는 우주의 신이다. 이제 도현이는 아무렇게나 널브러져 있는 n개의 별들을 이어서 별자리를 하나 만들 것이다. 별자리의 조건은 다음과 같다.

 별자리를 이루는 선은 서로 다른 두 별을 일직선으로 이은 형태이다.
 모든 별들은 별자리 위의 선을 통해 서로 직/간접적으로 이어져 있어야 한다.
 별들이 2차원 평면 위에 놓여 있다. 선을 하나 이을 때마다 두 별 사이의 거리만큼의 비용이 든다고 할 때, 별자리를 만드는 최소 비용을 구하시오.

 입력
 첫째 줄에 별의 개수 n이 주어진다. (1 ≤ n ≤ 100)

 둘째 줄부터 n개의 줄에 걸쳐 각 별의 x, y좌표가 실수 형태로 주어지며, 최대 소수점 둘째자리까지 주어진다. 좌표는 1000을 넘지 않는 양의 실수이다.

 출력
 첫째 줄에 정답을 출력한다. 절대/상대 오차는 10-2까지 허용한다.

 예제 입력 1
 3
 1.0 1.0
 2.0 2.0
 2.0 4.0
 
 예제 출력 1
 3.41
 
 [반례]
 6
 4 1
 5 8
 2 1
 8 4
 2 9
 1 4
 정답: 18.32
 */
