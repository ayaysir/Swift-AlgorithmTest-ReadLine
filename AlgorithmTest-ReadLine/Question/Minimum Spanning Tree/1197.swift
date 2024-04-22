//
//  1197.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/20/2024.
//
//  2: 최소 스패닝 트리 https://www.acmicpc.net/problem/1197
//

import Foundation

/// 최소 스패닝 트리 https://www.acmicpc.net/problem/1197
func Q_1197() {
    typealias Edge = (weight: Int, from: Int, to: Int)
    
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (v, e) = (r[0], r[1])
    
    /// 유니온 파인드에서 부모 정보를 담는 배열
    /// - 인덱스: 어떤 노드 번호
    /// - 값: 그 어떤 노드의 부모 노드 번호
    var unf = Array(0...v)
    
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
    
    func union(edge: Edge) {
        union(edge.from, edge.to)
    }
    
    func hasSameParent(edge: Edge) -> Bool {
        find(edge.from) == find(edge.to)
    }
    
    let edges: [Edge] = {
        var array = [Edge]()
        
        for _ in 0..<e {
            let r = readLine()!.split(separator: " ").map { Int($0)! }
            array.append((r[2], r[0], r[1]))
        }
        
        return array.sorted(by: { $0.weight < $1.weight })
    }()
    var wSum = 0
    
    for i in 0..<e where !hasSameParent(edge: edges[i]) {
        union(edge: edges[i])
        wSum += edges[i].weight
    }
    
    print(wSum)
}

/*
 [풀이] https://yabmoons.tistory.com/186
 가중치가 있는 그래프의 최소 신장 트리 구하기 => 크루스칼 알고리즘(Kruskal's Algorithm) 사용
 (1) 모든 간선들의 가중치를 오름차순으로 정렬한다.
  => 2번 과정에서 가장 작은 가중치를 먼저 선택하기 위함
 (2) 가중치가 가장 작은 간선을 선택한다.
  => 1번에서 오름차순으로 정렬되었으므로 정렬된 간선 목록의 순서대로 선택하면 된다.
 (3) 2번에서 선택한 간선의 노드들이 연결되지 않았다면, 서로 연결한다.
  => ⭐️⭐️ 연결 여부 및 연결하는 방법: 유니온 파인드(Union-Find) 사용 ⭐️⭐️
  => 연결할 때 그 간선의 가중치를 최종 결과에 더해준다.
 (4) 위의 과정을 반복한다. (=> 정렬된 간선 목록을 돌면서)
 
 ------
 
 문제
 그래프가 주어졌을 때, 그 그래프의 최소 스패닝 트리를 구하는 프로그램을 작성하시오.

 최소 스패닝 트리는, 주어진 그래프의 모든 정점들을 연결하는 부분 그래프 중에서 그 가중치의 합이 최소인 트리를 말한다.

 입력
 첫째 줄에 정점의 개수 V(1 ≤ V ≤ 10,000)와 간선의 개수 E(1 ≤ E ≤ 100,000)가 주어진다. 다음 E개의 줄에는 각 간선에 대한 정보를 나타내는 세 정수 A, B, C가 주어진다. 이는 A번 정점과 B번 정점이 가중치 C인 간선으로 연결되어 있다는 의미이다. C는 음수일 수도 있으며, 절댓값이 1,000,000을 넘지 않는다.

 그래프의 정점은 1번부터 V번까지 번호가 매겨져 있고, 임의의 두 정점 사이에 경로가 있다. 최소 스패닝 트리의 가중치가 -2,147,483,648보다 크거나 같고, 2,147,483,647보다 작거나 같은 데이터만 입력으로 주어진다.

 출력
 첫째 줄에 최소 스패닝 트리의 가중치를 출력한다.

 예제 입력 1
 3 3
 1 2 1
 2 3 2
 1 3 3
 
 예제 출력 1
 3
 */
