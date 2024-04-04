//
//  1956.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/3/2024.
//
//  7: 운동 https://www.acmicpc.net/problem/1956
//

import Foundation

/// 운동 https://www.acmicpc.net/problem/1956
func Q_1956() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (v, e) = (r[0], r[1])
    
    var dists = Array(repeating: Array(repeating: Int.max, count: v + 1), count: v + 1)
    
    for i in 1...v {
        dists[i][i] = 0
    }
    
    for _ in 0..<e {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (u, v, w) = (r[0], r[1], r[2])
        dists[u][v] = min(dists[u][v], w)
    }
    
    for h in 1...v {
        for i in 1...v {
            for j in 1...v {
                if dists[i][h] != .max,
                   dists[h][j] != .max,
                   dists[i][j] > dists[i][h] + dists[h][j] {
                    dists[i][j] = dists[i][h] + dists[h][j]
                }
            }
        }
    }
    
    var minDist = Int.max
    for i in 1...v {
        for j in 1...v where i != j && (dists[i][j] != .max && dists[j][i] != .max) {
            minDist = min(minDist, dists[i][j] + dists[j][i])
        }
    }
    
    print(minDist == .max ? -1 : minDist)
}

/*
 [풀이]
 - 플로이드-워셜 알고리즘 사용
 - 문제에서 "두 마을을 왕복하는 경우도 사이클에 포함됨에 주의한다."라고 했지만, 어차피 최단거리 사이클을 찾기 위해서는
   두 마을을 왕복하는 경우만 찾아야 함
 - 모든 마을간 최단거리를 나열한 뒤 두 마을을 왕복했을 때 가장 작은 값이 정답
  => 두 마을 왕복거리 dists[i][j] + dists[i][j] 가 최소가 되는 값
 
 [주의]
 - 최단거리가 없는 경우(minDist = .max)도 있으므로 예외처리
 
 -----
 
 문제
 V개의 마을와 E개의 도로로 구성되어 있는 도시가 있다. 도로는 마을과 마을 사이에 놓여 있으며, 일방 통행 도로이다. 마을에는 편의상 1번부터 V번까지 번호가 매겨져 있다고 하자.

 당신은 도로를 따라 운동을 하기 위한 경로를 찾으려고 한다. 운동을 한 후에는 다시 시작점으로 돌아오는 것이 좋기 때문에, 우리는 사이클을 찾기를 원한다. 단, 당신은 운동을 매우 귀찮아하므로, 사이클을 이루는 도로의 길이의 합이 최소가 되도록 찾으려고 한다.

 도로의 정보가 주어졌을 때, 도로의 길이의 합이 가장 작은 사이클을 찾는 프로그램을 작성하시오. 두 마을을 왕복하는 경우도 사이클에 포함됨에 주의한다.

 입력
 첫째 줄에 V와 E가 빈칸을 사이에 두고 주어진다. (2 ≤ V ≤ 400, 0 ≤ E ≤ V(V-1)) 다음 E개의 줄에는 각각 세 개의 정수 a, b, c가 주어진다. a번 마을에서 b번 마을로 가는 거리가 c인 도로가 있다는 의미이다. (a → b임에 주의) 거리는 10,000 이하의 자연수이다. (a, b) 쌍이 같은 도로가 여러 번 주어지지 않는다.

 출력
 첫째 줄에 최소 사이클의 도로 길이의 합을 출력한다. 운동 경로를 찾는 것이 불가능한 경우에는 -1을 출력한다.

 예제 입력 1
 3 4
 1 2 1
 3 2 1
 1 3 5
 2 3 2
 
 예제 출력 1
 3
 */
