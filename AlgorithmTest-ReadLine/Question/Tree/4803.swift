//
//  4803.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/12/2024.
//
//  7: 트리 https://www.acmicpc.net/problem/4803
//

import Foundation

/// 트리 https://www.acmicpc.net/problem/4803
func Q_4803() {
    var caseNumber = 1, result = ""
    
    while let r = readLine(), r != "0 0" {
        let nm = r.split(separator: " ").map { Int($0)! }
        let (n, m) = (nm[0], nm[1])
        
        var graph = Array(repeating: [Int](), count: n + 1)
        var visited = Array(repeating: 0, count: n + 1)
        
        for _ in 0..<m {
            let uv = readLine()!.split(separator: " ").map { Int($0)! }
            let (u, v) = (uv[0], uv[1])
            graph[u].append(v)
            graph[v].append(u)
        }
        
        var treeCount = 0
        for i in 1...n where visited[i] == 0 {
            treeCount += bfs(i, graph, &visited) ? 1 : 0
        }
        
        result += "Case \(caseNumber): "
        
        switch treeCount {
        case 0:
            result += "No trees."
        case 1:
            result += "There is one tree."
        default:
            result += "A forest of \(treeCount) trees."
        }
        
        result += "\n"
        caseNumber += 1
    }
    
    print(result)
    
    func bfs(_ k: Int, _ graph: [[Int]], _ visited: inout [Int]) -> Bool {
        var q = [k], sIdx = 0
        visited[k] = 1
        
        var isTree = true
        while sIdx < q.count {
            let pop = q[sIdx]; sIdx += 1
            
            for next in graph[pop] {
                if visited[next] != 0, visited[next] != visited[pop] - 1 {
                    isTree = false
                }
                
                if visited[next] != 0 {
                    continue
                }
                
                visited[next] = visited[pop] + 1
                q.append(next)
            }
        }
        
        return isTree
    }
}

/*
 [풀이] https://codingnotes.tistory.com/196
 - BFS를 이용하여 해결 (Union & Find를 이용한 방법도 있으나 아직 학습하지 않았으므로 패스)
 (1) 트리의 방문하지 않은 각 정점부터 시작하여 BFS를 수행
 (2) 인접한 정점(next)이 이미 방문했지만, next가 pop의 부모 노드가 아닌 경우
    => 싸이클이 존재함. 따라서, 트리가 아니라고 판단한다.
  예)
        1                     * 1의 가지 [2, 3] => 방문 여부 표시 visited[1..3] = [1, 2, 2]
       / \                    * 2의 가지 [3, ..] => visited[3(next)] = 2, visited[2(pop)] = 2
      2 - 3 인 경우               => next를 이미 방문했는데, next가 pop의 부모가 아님
                                => visited[next] != 0, visited[next] == visited[pop]
                                => 사이클이 존재한다고 판단. 실제로 1 ~ 3 사이에 사이클이 존재
 
 
 (3) 인접한 정점이 이미 방문하였고, 부모 노드인 경우 방문을 진행
    => 부모 노드는 자식 노드보다 1 작다.
    => 예) A - B 가 부모 자식이며 visited[A] = 2인 경우 visited[B] = 3이어야 한다.
 
 --------
 
 문제
 그래프는 정점과 간선으로 이루어져 있다. 두 정점 사이에 경로가 있다면, 두 정점은 연결되어 있다고 한다. 연결 요소는 모든 정점이 서로 연결되어 있는 정점의 부분집합이다. 그래프는 하나 또는 그 이상의 연결 요소로 이루어져 있다.

 트리는 사이클이 없는 연결 요소이다. 트리에는 여러 성질이 있다. 예를 들어, 트리는 정점이 n개, 간선이 n-1개 있다. 또, 임의의 두 정점에 대해서 경로가 유일하다.

 그래프가 주어졌을 때, 트리의 개수를 세는 프로그램을 작성하시오.

 입력
 입력은 여러 개의 테스트 케이스로 이루어져 있다. 각 테스트 케이스의 첫째 줄에는 n ≤ 500과 m ≤ n(n-1)/2을 만족하는 정점의 개수 n과 간선의 개수 m이 주어진다. 다음 m개의 줄에는 간선을 나타내는 두 개의 정수가 주어진다. 같은 간선은 여러 번 주어지지 않는다. 정점은 1번부터 n번까지 번호가 매겨져 있다. 입력의 마지막 줄에는 0이 두 개 주어진다.

 출력
 입력으로 주어진 그래프에 트리가 없다면 "No trees."를, 한 개라면 "There is one tree."를, T개(T > 1)라면 "A forest of T trees."를 테스트 케이스 번호와 함께 출력한다.

 예제 입력 1
 6 3
 1 2
 2 3
 3 4
 6 5
 1 2
 2 3
 3 4
 4 5
 5 6
 6 6
 1 2
 2 3
 1 3
 4 5
 5 6
 6 4
 0 0
 
 예제 출력 1
 Case 1: A forest of 3 trees.
 Case 2: There is one tree.
 Case 3: No trees.
 */
