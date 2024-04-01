//
//  24479.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/31/24.
//

// import Foundation

/// 알고리즘 수업 - 깊이 우선 탐색 1 https://www.acmicpc.net/problem/24479
func Q_24479() {
    let cmd = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m, r) = (cmd[0], cmd[1], cmd[2])
    var graphs = [Int : [Int]]()
    var visited = Array(repeating: 0, count: n + 1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        graphs[input[0], default: []].append(input[1])
        graphs[input[1], default: []].append(input[0])
    }
    
    var count = 1
    
    func dfs(_ r: Int) {
        visited[r] = count
        
        for x in graphs[r, default: []].sorted() where visited[x] == 0 {
            count += 1
            dfs(x)
        }
    }
    
    dfs(r)
    
    var result = ""
    for i in 1...n {
        result.write("\(visited[i])\n")
    }
    
    print(result)
}

/*
 [틀린 이유]
 1. 그래프를 만들때엔 for문을 n(정점 vertex 개수)가 아니라 m(간선 edge 개수)까지 돌려야 한다.
 2. 문제 정답 조건을 잘 읽어야 한다. 정점을 단순히 순서대로 보여주는 게 아니라 '어떤 정점이 몇 번째로 순회되었나'를 표시하는 것이다.
 
 [런타임 에러 이유]
 어떤 정점에 간선이 하나도 없는 케이스가 있을 수 있는데, 그런 없는 사전값을 강제 언래핑 처리해서 에러 발생한 것이다.

 -----------
 
 문제
 오늘도 서준이는 깊이 우선 탐색(DFS) 수업 조교를 하고 있다. 아빠가 수업한 내용을 학생들이 잘 이해했는지 문제를 통해서 확인해보자.

 N개의 정점과 M개의 간선으로 구성된 무방향 그래프(undirected graph)가 주어진다. 정점 번호는 1번부터 N번이고 모든 간선의 가중치는 1이다. 정점 R에서 시작하여 깊이 우선 탐색으로 노드를 방문할 경우 노드의 방문 순서를 출력하자.

 깊이 우선 탐색 의사 코드는 다음과 같다. 인접 정점은 오름차순으로 방문한다.

 dfs(V, E, R) {  # V : 정점 집합, E : 간선 집합, R : 시작 정점
     visited[R] <- YES;  # 시작 정점 R을 방문 했다고 표시한다.
     for each x ∈ E(R)  # E(R) : 정점 R의 인접 정점 집합.(정점 번호를 오름차순으로 방문한다)
         if (visited[x] = NO) then dfs(V, E, x);
 }
 입력
 첫째 줄에 정점의 수 N (5 ≤ N ≤ 100,000), 간선의 수 M (1 ≤ M ≤ 200,000), 시작 정점 R (1 ≤ R ≤ N)이 주어진다.

 다음 M개 줄에 간선 정보 u v가 주어지며 정점 u와 정점 v의 가중치 1인 양방향 간선을 나타낸다. (1 ≤ u < v ≤ N, u ≠ v) 모든 간선의 (u, v) 쌍의 값은 서로 다르다.

 출력
 첫째 줄부터 N개의 줄에 정수를 한 개씩 출력한다. i번째 줄에는 정점 i의 방문 순서를 출력한다. 시작 정점의 방문 순서는 1이다. 시작 정점에서 방문할 수 없는 경우 0을 출력한다.

 예제 입력 1
 5 5 1
 1 4
 1 2
 2 3
 2 4
 3 4
 
 예제 출력 1
 1
 2
 3
 4
 0
 
 정점 1번에서 정점 2번을 방문한다. 정점 2번에서 정점 3번을 방문한다. 정점 3번에서 정점 4번을 방문한다. 정점 5번은 정점 1번에서 방문할 수 없다.
 */
