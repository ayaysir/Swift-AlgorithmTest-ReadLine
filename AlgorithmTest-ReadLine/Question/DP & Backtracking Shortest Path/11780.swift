//
//  11780.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/8/2024.
//
//  9: 플로이드 2 https://www.acmicpc.net/problem/11780
//

import Foundation

/// 플로이드 2 https://www.acmicpc.net/problem/11780
func Q_11780() {
    func sum(_ args: Int...) -> Int {
        args.max() == .max ? .max : args.reduce(0, +)
    }
    
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    
    var dists = Array(repeating: Array(repeating: Int.max, count: n + 1), count: n + 1)
    var nexts = Array(repeating: Array(repeating: -1, count: n + 1), count: n + 1)
    
    for i in 1...n {
        dists[i][i] = 0
    }
    
    for _ in 0..<m {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (u, v, c) = (r[0], r[1], r[2])
        
        if dists[u][v] > c {
            dists[u][v] = c
            nexts[u][v] = v // 📍
        }
    }
    
    for h in 1...n {
        for i in 1...n {
            for j in 1...n where dists[i][j] > sum(dists[i][h], dists[h][j]) {
                dists[i][j] = sum(dists[i][h], dists[h][j])
                nexts[i][j] = nexts[i][h] // 📍
            }
        }
    }
    
    var result = ""
    
    for i in 1...n {
        for j in 1...n {
            result.write(dists[i][j] == .max ? "0 " : "\(dists[i][j]) ")
        }
        result.write("\n")
    }
    
    // 경로 추적 📍
    for i in 1...n {
        for j in 1...n {
            if nexts[i][j] == -1 {
                result.write("0\n")
                continue
            }
            
            var (u, v) = (i, j)
            var path = "\(u) ", pathCount = 1
            while u != v {
                u = nexts[u][v]
                path.write("\(u) ")
                pathCount += 1
            }
            
            result.write("\(pathCount) \(path)\n")
        }
    }
    
    print(result)
}

/*
 [풀이] https://ko.wikipedia.org/플로이드-워셜_알고리즘#경로_복원
 - 플로이드-워셜 알고리즘 문제인 플로이드(11404)에 경로 추적이 추가됨 (📍 표시 부분)
 
 [코드]
 let dist be a |V| * |V| array of minimum distances initialized to  (infinity)
 let next be a |V| * |V| array of vertex indices initialized to null
 
 procedure FloydWarshallWithPathReconstruction ()
    for each edge (u,v)
       dist[u][v] ← w(u,v)  // 변 (u,v)의 가중치
       next[u][v] ← v // 📍
    for k from 1 to |V| // 일반적인 플로이드-워셜의 수행
       for i from 1 to |V|
          for j from 1 to |V|
             if dist[i][j] > dist[i][k] + dist[k][j] then
                dist[i][j] ← dist[i][k] + dist[k][j]
                next[i][j] ← next[i][k] // 📍
 
 procedure Path📍(u, v)
    if next[u][v] = null then
        return []
    path = [u]
    while u ≠ v
        u ← next[u][v]
        path.append(u)
    return path
 
 ----------
 
 문제
 n(1 ≤ n ≤ 100)개의 도시가 있다. 그리고 한 도시에서 출발하여 다른 도시에 도착하는 m(1 ≤ m ≤ 100,000)개의 버스가 있다. 각 버스는 한 번 사용할 때 필요한 비용이 있다.

 모든 도시의 쌍 (A, B)에 대해서 도시 A에서 B로 가는데 필요한 비용의 최솟값을 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 도시의 개수 n이 주어지고 둘째 줄에는 버스의 개수 m이 주어진다. 그리고 셋째 줄부터 m+2줄까지 다음과 같은 버스의 정보가 주어진다. 먼저 처음에는 그 버스의 출발 도시의 번호가 주어진다. 버스의 정보는 버스의 시작 도시 a, 도착 도시 b, 한 번 타는데 필요한 비용 c로 이루어져 있다. 시작 도시와 도착 도시가 같은 경우는 없다. 비용은 100,000보다 작거나 같은 자연수이다.

 출력
 먼저, n개의 줄을 출력해야 한다. i번째 줄에 출력하는 j번째 숫자는 도시 i에서 j로 가는데 필요한 최소 비용이다. 만약, i에서 j로 갈 수 없는 경우에는 그 자리에 0을 출력한다.

 그 다음에는 n×n개의 줄을 출력해야 한다. i×n+j번째 줄에는 도시 i에서 도시 j로 가는 최소 비용에 포함되어 있는 도시의 개수 k를 출력한다. 그 다음, 도시 i에서 도시 j로 가는 경로를 공백으로 구분해 출력한다. 이때, 도시 i와 도시 j도 출력해야 한다. 만약, i에서 j로 갈 수 없는 경우에는 0을 출력한다.

 예제 입력 1
 5
 14
 1 2 2
 1 3 3
 1 4 1
 1 5 10
 2 4 2
 3 4 1
 3 5 1
 4 5 3
 3 5 10
 3 1 8
 1 4 2
 5 1 7
 3 4 2
 5 2 4
 
 예제 출력 1
 0 2 3 1 4
 12 0 15 2 5
 8 5 0 1 1
 10 7 13 0 3
 7 4 10 6 0
 0
 2 1 2
 2 1 3
 2 1 4
 3 1 3 5
 4 2 4 5 1
 0
 5 2 4 5 1 3
 2 2 4
 3 2 4 5
 2 3 1
 3 3 5 2
 0
 2 3 4
 2 3 5
 3 4 5 1
 3 4 5 2
 4 4 5 1 3
 0
 2 4 5
 2 5 1
 2 5 2
 3 5 1 3
 3 5 2 4
 0
 */
