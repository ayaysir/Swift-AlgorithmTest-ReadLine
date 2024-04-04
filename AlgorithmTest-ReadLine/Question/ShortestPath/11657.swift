//
//  11657.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/3/2024.
//
//  5: 타임머신 https://www.acmicpc.net/problem/11657
//

import Foundation

/// 타임머신 https://www.acmicpc.net/problem/11657
func Q_11657() {
    typealias Edge = (a: Int, b: Int, w: Int)
    
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    /// 모든 간선(Edge)에 대한 정보를 담는 리스트
    var edges: [Edge] = (0..<m).map { _ in makeEdge(from: readLine()!.split(separator: " ").map { Int($0)! }) }
    var dists = Array(repeating: Int.max, count: n + 1)
    
    func bellmanFord(_ k: Int) -> Bool {
        // 시작 노드에 대해 초기화
        dists[k] = 0
        
        // 전체 v - 1번의 라운드(round)를 반복
        for i in 0..<n {
            // 매 반복마다 '모든 간선'을 확인
            for j in 0..<m {
                let (currentNode, nextNode, edgeCost) = edges[j]
                
                // 현재 간선을 거쳐서 다른 노드로 이동하는 거리가 더 짧은 경우
                if dists[currentNode] != .max, dists[nextNode] > dists[currentNode] + edgeCost {
                    dists[nextNode] = dists[currentNode] + edgeCost
                    
                    // v번째 라운드에서도 값이 갱신된다면 음수 순환이 존재
                    if i == n - 1 {
                        return false
                    }
                }
            }
        }
        
        return true
    }
    
    if bellmanFord(1) {
        for i in 2...n {
            print(dists[i] == .max ? -1 : dists[i])
        }
    } else {
        print(-1)
    }
    
    func makeEdge(from array: [Int]) -> Edge {
        (array[0], array[1], array[2])
    }
}

/*
 [풀이] https://velog.io/@kimdukbae/알고리즘-벨만-포드-알고리즘-Bellman-Ford-Algorithm
  (-)의 가중치가 있는 최단경로를 구하는 문제: 벨만-포드 알고리즘
  https://ko.wikipedia.org/wiki/벨먼-포드_알고리즘
 
 ---------
 
 문제
 N개의 도시가 있다. 그리고 한 도시에서 출발하여 다른 도시에 도착하는 버스가 M개 있다. 각 버스는 A, B, C로 나타낼 수 있는데, A는 시작도시, B는 도착도시, C는 버스를 타고 이동하는데 걸리는 시간이다. 시간 C가 양수가 아닌 경우가 있다. C = 0인 경우는 순간 이동을 하는 경우, C < 0인 경우는 타임머신으로 시간을 되돌아가는 경우이다.

 1번 도시에서 출발해서 나머지 도시로 가는 가장 빠른 시간을 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 도시의 개수 N (1 ≤ N ≤ 500), 버스 노선의 개수 M (1 ≤ M ≤ 6,000)이 주어진다. 둘째 줄부터 M개의 줄에는 버스 노선의 정보 A, B, C (1 ≤ A, B ≤ N, -10,000 ≤ C ≤ 10,000)가 주어진다.

 출력
 만약 1번 도시에서 출발해 어떤 도시로 가는 과정에서 시간을 무한히 오래 전으로 되돌릴 수 있다면 첫째 줄에 -1을 출력한다. 그렇지 않다면 N-1개 줄에 걸쳐 각 줄에 1번 도시에서 출발해 2번 도시, 3번 도시, ..., N번 도시로 가는 가장 빠른 시간을 순서대로 출력한다. 만약 해당 도시로 가는 경로가 없다면 대신 -1을 출력한다.

 예제 입력 1
 3 4
 1 2 4
 1 3 3
 2 3 -1
 3 1 -2
 
 예제 출력 1
 4
 3
 
 예제 입력 2
 3 4
 1 2 4
 1 3 3
 2 3 -4
 3 1 -2
 예제 출력 2
 -1
 
 예제 입력 3
 3 2
 1 2 4
 1 2 3
 예제 출력 3
 3
 -1
 
 */
