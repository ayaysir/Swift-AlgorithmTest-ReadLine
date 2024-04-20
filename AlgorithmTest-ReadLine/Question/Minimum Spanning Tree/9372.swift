//
//  9372.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/20/2024.
//
//  1: 상근이의 여행 https://www.acmicpc.net/problem/9372
//

import Foundation

/// 상근이의 여행 https://www.acmicpc.net/problem/9372
/// - 최소 신장 트리
func Q_9372() {
    var result = ""
    
    for _ in 0..<Int(readLine()!)! {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, m) = (r[0], r[1])
        result.write("\(n - 1)\n")
        (0..<m).forEach { _ in _ = readLine() }
    }

    print(result)
}

/// 상근이의 여행 https://www.acmicpc.net/problem/9372
/// - BFS
func Q_9372_() {
    var result = ""
    
    for _ in 0..<Int(readLine()!)! {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, m) = (r[0], r[1])
        
        var graph = Array(repeating: [Int](), count: n + 1)
        var visited = Array(repeating: false, count: n + 1)
        
        // 그래프 생성
        for _ in 0..<m {
            let r = readLine()!.split(separator: " ").map { Int($0)! }
            let (a, b) = (r[0], r[1])
            graph[a].append(b)
            graph[b].append(a)
        }
        
        // BFS
        var q = [1], sIdx = 0
        var count = 0
        visited[1] = true
        
        while sIdx < q.count {
            let pop = q[sIdx]; sIdx += 1
            
            for v in graph[pop] where !visited[v] {
                visited[v] = true
                count += 1
                q.append(v)
            }
        }
        
        result.write("\(count)\n")
    }

    print(result)
}

/*
 [풀이]
 * "주어지는 비행 스케줄은 항상 연결 그래프를 이룬다."
 * "가장 적은 종류의 비행기를 타고"
 * "비행기 종류의 최소 개수를 출력한다."
 
  (1) 최소 신장 트리
   - 신장 트리(Spanning Tree)란 그래프 상에서 모든 노드가 사이클 없이 연결된 부분 그래프
   - 신장 트리는 방향이 없는 그래프 (무방향 그래프)
   - 그 중 최소 신장 트리(Minimum Spanning Tree)는
     - 신장 트리 중 가장 적은 간선의 개수를 가진 트리이다.
     - 최소 신장 트리는 간선의 개수가 (정점의 개수 - 1)인 트리이다.
  (2) BFS
   - 무방향 그래프이므로 BFS로도 탐색할 수 있다.
   - 임의의 노드 (여기서는 1)에서 BFS를 수행해서 종료되었을 때 카운트를 출력
 
 --------
 
 문제
 상근이는 겨울방학을 맞아 N개국을 여행하면서 자아를 찾기로 마음먹었다.

 하지만 상근이는 새로운 비행기를 무서워하기 때문에, 최대한 적은 종류의 비행기를 타고 국가들을 이동하려고 한다.

 이번 방학 동안의 비행 스케줄이 주어졌을 때, 상근이가 가장 적은 종류의 비행기를 타고 모든 국가들을 여행할 수 있도록 도와주자.

 상근이가 한 국가에서 다른 국가로 이동할 때 다른 국가를 거쳐 가도(심지어 이미 방문한 국가라도) 된다.

 입력
 첫 번째 줄에는 테스트 케이스의 수 T(T ≤ 100)가 주어지고,

 각 테스트 케이스마다 다음과 같은 정보가 주어진다.

 첫 번째 줄에는 국가의 수 N(2 ≤ N ≤ 1 000)과 비행기의 종류 M(1 ≤ M ≤ 10 000) 가 주어진다.
 이후 M개의 줄에 a와 b 쌍들이 입력된다. a와 b를 왕복하는 비행기가 있다는 것을 의미한다. (1 ≤ a, b ≤ n; a ≠ b)
 주어지는 비행 스케줄은 항상 연결 그래프를 이룬다.
 
 출력
 테스트 케이스마다 한 줄을 출력한다.

 상근이가 모든 국가를 여행하기 위해 타야 하는 비행기 종류의 최소 개수를 출력한다.
 예제 입력 1
 2
 3 3
 1 2
 2 3
 1 3
 5 4
 2 1
 2 3
 4 3
 4 5
 
 예제 출력 1
 2
 4
 
 */
