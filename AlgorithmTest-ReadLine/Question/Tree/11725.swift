//
//  11725.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/12/2024.
//
//  1: 트리의 부모 찾기 https://www.acmicpc.net/problem/11725
//

import Foundation

/// 트리의 부모 찾기 https://www.acmicpc.net/problem/11725
func Q_11725() {
    let n = Int(readLine()!)!

    var graph: [[Int]] = .init(repeating: [], count: n + 1)
    var visited = Array(repeating: -1, count: n + 1)
    
    for _ in 0..<n - 1 {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b) = (r[0], r[1])
        graph[a].append(b)
        graph[b].append(a)
    }
    
    // BFS
    var q = [1], sIdx = 0
    visited[1] = 0
    
    while sIdx < q.count {
        let pop = q[sIdx]; sIdx += 1
        
        for v in graph[pop] where visited[v] == -1 {
            visited[v] = pop // 부모(pop)가 누군지 기록
            q.append(v)
        }
    }
    
    var result = ""
    for i in visited.indices where i > 1 {
        result.write("\(visited[i])\n")
    }
    
    print(result)
}

/*
 [풀이]
 - 루트는 1로 고정
 - 트리는 무방향 그래프
   - whose underlying undirected graph is a tree
 - BFS로 순회 (DFS도 가능)
 - 부모를 찾아서 visited 배열의 값으로 기록
   - 큐에서 dequeue 한 것이 부모, graph[dequeued]은 그 자식들
 
 ---------
 
 문제
 루트 없는 트리가 주어진다. 이때, 트리의 루트를 1이라고 정했을 때, 각 노드의 부모를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 노드의 개수 N (2 ≤ N ≤ 100,000)이 주어진다. 둘째 줄부터 N-1개의 줄에 트리 상에서 연결된 두 정점이 주어진다.

 출력
 첫째 줄부터 N-1개의 줄에 각 노드의 부모 노드 번호를 2번 노드부터 순서대로 출력한다.

 예제 입력 1
 7
 1 6
 6 3
 3 5
 4 1
 2 4
 4 7
 예제 출력 1
 4
 6
 1
 3
 1
 4
 
 예제 입력 2
 12
 1 2
 1 3
 2 4
 3 5
 3 6
 4 7
 4 8
 5 9
 5 10
 6 11
 6 12
 예제 출력 2
 1
 1
 2
 3
 3
 4
 4
 5
 5
 6
 6
 */
