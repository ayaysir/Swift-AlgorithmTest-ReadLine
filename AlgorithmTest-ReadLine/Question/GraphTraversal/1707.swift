//
//  1707.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/31/2024.
//
//  16: 이분 그래프 https://www.acmicpc.net/problem/1707
//

import Foundation

/// 이분 그래프 https://www.acmicpc.net/problem/1707
func Q_1707() {
    enum Color {
        case red, blue
        
        var oppositeColor: Self {
            self == .red ? .blue : .red
        }
    }
    
    var result = ""
    
    for _ in (0..<Int(readLine()!)!) {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (v, e) = (r[0], r[1])
        var visited = [Color?](repeating: nil, count: v + 1)
        var graph = Array(repeating: [Int](), count: v + 1)
        
        for _ in 0..<e {
            let r = readLine()!.split(separator: " ").map { Int($0)! }
            let (u, v) = (r[0], r[1])
            graph[u].append(v)
            graph[v].append(u)
        }
        
        for n in graph.indices where visited[n] == nil {
            dfs(n, graph, &visited)
        }
                
        result.write(isBipartite(v, graph, &visited) ? "YES\n" : "NO\n")
    }
    
    print(result)

    func dfs(_ node: Int, _ graph: [[Int]], _ visited: inout [Color?]) {
        if visited[node] == nil {
            visited[node] = .red
        }
        
        // 현재 정점(n)과 연결된 모든 정점들을 방문 (어떤 정점 n과 연결된 모든 다른 정점들 graph[node][i])
        for i in graph[node].indices {
            let next = graph[node][i]
            
            if visited[next] == nil {
                visited[next] = visited[node]!.oppositeColor
                dfs(next, graph, &visited)
            }
        }
    }
    
    func isBipartite(_ v: Int, _ graph: [[Int]], _ visited: inout [Color?]) -> Bool {
        for node in 1...v {
            for i in graph[node].indices {
                let next = graph[node][i]
                if visited[i] == visited[next] {
                    return false
                }
            }
        }
        
        return true
    }
}

/*
 [풀이] https://m42-orion.tistory.com/61
 - 이분 그래프
   - 정점을 두 팀으로 나눌 수 있고, 같은 팀원은 연결되어 있지 않은 그래프
   - 상대방 팀원과 연결될 수는 있지만, 자신의 팀원을 연결할 수 없음
   - 만약 두 팀을 다른 색으로 색칠했다면, 다른 색끼리 연결은 허용되며, 같은 색깔의 팀원들끼리는 연결되면 안된다.
 
 - DFS를 통한 풀이
   (1) 입력을 받으면서 정점 간에 간선을 양방향으로 연결해준다.
   (2) DFS를 통해서 정점의 색을 칠해준다.
     - 정점을 아직 방문하지 않았다면 RED(빨간색)으로 칠해주고,
     - 현재 방문하고 있는 정점과 인접해있는 정점의 색을 현재 색과 다른 색으로 칠해준다.
   (3) 정점에 색을 칠하는 과정이 끝나면, 모든 정점에 대해서 연결되어 있는 정점들을 검사하면서 (=> graph[node][i])
     - 만일 색이 같다면 그 즉시 false를 반환하고 (=> 이분 그래프 X)
     - 모든 정점을 검사했는데 위와 같은 경우가 끝까지 없었다면 true를 반환한다. (=> 이분 그래프 O)
 
 ---------
 
 문제
 그래프의 정점의 집합을 둘로 분할하여, 각 집합에 속한 정점끼리는 서로 인접하지 않도록 분할할 수 있을 때, 그러한 그래프를 특별히 이분 그래프 (Bipartite Graph) 라 부른다.

 그래프가 입력으로 주어졌을 때, 이 그래프가 이분 그래프인지 아닌지 판별하는 프로그램을 작성하시오.

 입력
 입력은 여러 개의 테스트 케이스로 구성되어 있는데, 첫째 줄에 테스트 케이스의 개수 K가 주어진다. 각 테스트 케이스의 첫째 줄에는 그래프의 정점의 개수 V와 간선의 개수 E가 빈 칸을 사이에 두고 순서대로 주어진다. 각 정점에는 1부터 V까지 차례로 번호가 붙어 있다. 이어서 둘째 줄부터 E개의 줄에 걸쳐 간선에 대한 정보가 주어지는데, 각 줄에 인접한 두 정점의 번호 u, v (u ≠ v)가 빈 칸을 사이에 두고 주어진다.

 출력
 K개의 줄에 걸쳐 입력으로 주어진 그래프가 이분 그래프이면 YES, 아니면 NO를 순서대로 출력한다.

 제한
 2 ≤ K ≤ 5
 1 ≤ V ≤ 20,000
 1 ≤ E ≤ 200,000
 
 예제 입력 1
 2
 3 2
 1 3
 2 3
 4 4
 1 2
 2 3
 3 4
 4 2
 
 예제 출력 1
 YES
 NO
 
 */
