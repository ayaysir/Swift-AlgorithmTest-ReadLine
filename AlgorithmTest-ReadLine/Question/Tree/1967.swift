//
//  1967.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/12/2024.
//
//  3: 트리의 지름 https://www.acmicpc.net/problem/1967
//

import Foundation

/// 트리의 지름 https://www.acmicpc.net/problem/1967
func Q_1967() {
    typealias Node = (v: Int, d: Int)
    
    let n = Int(readLine()!)!
    var graph: [[Node]] = .init(repeating: [], count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    var (maxNodeV, maxDist) = (0, Int.min)
    
    for _ in 0..<n - 1 {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (u, v, w) = (r[0], r[1], r[2])
        graph[u].append((v, w))
        graph[v].append((u, w))
    }
    
    func dfs(_ node: Node) {
        guard !visited[node.v] else {
           return
        }
        
        if maxDist < node.d {
            maxDist = node.d
            maxNodeV = node.v
        }
        
        visited[node.v] = true
        
        for neighbor in graph[node.v] {
            dfs((neighbor.v, neighbor.d + node.d))
        }
    }
    
    dfs((1, 0))
    
    visited = Array(repeating: false, count: n + 1)
    maxDist = .min
    dfs((maxNodeV, 0))
    
    print(maxDist)
}

/*
 [풀이]
 - 1167 문제 (트리의 지름)과 완전히 동일
 
 ------------
 
 입력
 파일의 첫 번째 줄은 노드의 개수 n(1 ≤ n ≤ 10,000)이다. 둘째 줄부터 n-1개의 줄에 각 간선에 대한 정보가 들어온다. 간선에 대한 정보는 세 개의 정수로 이루어져 있다. 첫 번째 정수는 간선이 연결하는 두 노드 중 부모 노드의 번호를 나타내고, 두 번째 정수는 자식 노드를, 세 번째 정수는 간선의 가중치를 나타낸다. 간선에 대한 정보는 부모 노드의 번호가 작은 것이 먼저 입력되고, 부모 노드의 번호가 같으면 자식 노드의 번호가 작은 것이 먼저 입력된다. 루트 노드의 번호는 항상 1이라고 가정하며, 간선의 가중치는 100보다 크지 않은 양의 정수이다.

 출력
 첫째 줄에 트리의 지름을 출력한다.

 예제 입력 1
 12
 1 2 3
 1 3 2
 2 4 5
 3 5 11
 3 6 9
 4 7 1
 4 8 7
 5 9 15
 5 10 4
 6 11 6
 6 12 10
 
 예제 출력 1
 45
 */
