//
//  1167.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/12/2024.
//
//  2: 트리의 지름 https://www.acmicpc.net/problem/1167
//

// import Foundation

/// 트리의 지름 https://www.acmicpc.net/problem/1167
func Q_1167() {
    typealias Node = (v: Int, d: Int)
    
    let v = Int(readLine()!)!
    var graph: [[Node]] = .init(repeating: [], count: v + 1)
    var visited = Array(repeating: false, count: v + 1)
    var (maxNodeV, maxDist) = (0, Int.min)
    
    for _ in 0..<v {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let u = r[0]
        for i in stride(from: 1, to: r.count - 1, by: 2) {
            graph[u].append((v: r[i], d: r[i + 1]))
        }
    }
    
    func dfs(_ node: Node) {
        if !visited[node.v] {
            if maxDist < node.d {
                maxDist = node.d
                maxNodeV = node.v
            }
            
            visited[node.v] = true
            
            for neighbor in graph[node.v] {
                dfs((neighbor.v, neighbor.d + node.d))
            }
        }
    }
    
    // dfs 1: 임의의 정점 1에서 가장 거리가 먼 정점 찾기 => maxNodeV
    dfs((1, 0))
    
    // dfs 2를 돌리기 위해 리셋
    visited = Array(repeating: false, count: v + 1)
    maxDist = .min
    
    // dfs 2: 1과 가장 먼 정점에서 다시 dfs 수행하여 트리의 지름 찾기 => maxDist
    dfs((maxNodeV, 0))
    
    print(maxDist)
}

/*
 [풀이] https://moonsbeen.tistory.com/101
 두 가지 정보가 필요
  (1) 임의의 정점에서 가장 거리가 먼 정점을 구한다.
  (2) (1)을 통해 구한 정점으로부터 가장 먼 정점까지의 거리를 구한다.
 => DFS를 두 번 실행한다.
 
 [해설]              최대 거리           공통점
         [1]     1 -> 11 -> 5         * 5 -> 1, 1 -> 5가 가장 먼 정점 사이의 거리일 때
       2 /       2 -> 10 -> 5         * 모든 정점에서부터의 최장 정점은 (1, 5)를 항상 포함
        /        3 ->  9 -> 5
       [3]       4 ->  6 -> 5        트리의 특성
     3 /         5 -> 11 -> 1         * 모든 정점은 사이클이 없이 연결이 되어 있음
      /                               * 한 정점에서 다른 정점으로 가는 경로는 유일
     [4]                               => 가장 멀리있는 두 정점의 경로는 항상 유일
   4 /  \ 6                           * 한 정점에서 가장 먼 정점으로 가는 경로와 가장
    /    \                              먼 정점 사이의 경로는 항상 일부가 겹친다.
   [2]   [5]                           => 각 정점에서 최장 정점을 구하면 항상 가장 먼 정점 중 하나를
                                          포함하는 것을 알 수 있다.
 
  => 임의의 정점에서 가장 거리가 먼 정점은 반드시 전체 거리가 가장 먼 정점 두개 중 하나이다.
     (1번 과정에서 정점을 임의로 정해도 되는 이유)
  => 그 정점에서 가장 거리가 먼 정점을 구하면 그 정점이 전체 트리 내에서 가장 거리가 긴 정점이고,
     그게 바로 트리의 지름이다.
     예) 1번 DFS를 통해 임의의 노드로부터 출발해서 5번 노드를 구했다면,
         그 5번노드에서 가장 거리가 먼 1번 노드까지의 거리가 트리의 지름
 
 --------
 
 문제
 트리의 지름이란, 트리에서 임의의 두 점 사이의 거리 중 가장 긴 것을 말한다. 트리의 지름을 구하는 프로그램을 작성하시오.

 입력
 트리가 입력으로 주어진다. 먼저 첫 번째 줄에서는 트리의 정점의 개수 V가 주어지고 (2 ≤ V ≤ 100,000)둘째 줄부터 V개의 줄에 걸쳐 간선의 정보가 다음과 같이 주어진다. 정점 번호는 1부터 V까지 매겨져 있다.

 먼저 정점 번호가 주어지고, 이어서 연결된 간선의 정보를 의미하는 정수가 두 개씩 주어지는데, 하나는 정점번호, 다른 하나는 그 정점까지의 거리이다. 예를 들어 네 번째 줄의 경우 정점 3은 정점 1과 거리가 2인 간선으로 연결되어 있고, 정점 4와는 거리가 3인 간선으로 연결되어 있는 것을 보여준다. 각 줄의 마지막에는 -1이 입력으로 주어진다. 주어지는 거리는 모두 10,000 이하의 자연수이다.

 출력
 첫째 줄에 트리의 지름을 출력한다.

 예제 입력 1
 5
 1 3 2 -1
 2 4 4 -1
 3 1 2 4 3 -1
 4 2 4 3 3 5 6 -1
 5 4 6 -1
 
 예제 출력 1
 11
 
 */
