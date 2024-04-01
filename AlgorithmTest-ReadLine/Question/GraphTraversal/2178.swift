//
//  2178.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/31/2024.
//
//  9: 미로 탐색 https://www.acmicpc.net/problem/2178
//

import Foundation

/// 미로 탐색 https://www.acmicpc.net/problem/2178
func Q_2178() {
    let cmd = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (cmd[0], cmd[1])
    let maze = (0..<n).map { _ in readLine()!.map(String.init) }
    var visited = Array(repeating: Array(repeating: -1, count: m), count: n)
    
    func bfs() {
        visited[0][0] = 1
        var q = [(y: Int, x: Int)]()
        var qStartIndex = 0
        q.append((0, 0))
        
        let dir4: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        
        while qStartIndex < q.count {
            let pop = q[qStartIndex]
            qStartIndex += 1
            
            for dir in dir4 {
                let ny = pop.y + dir.y
                let nx = pop.x + dir.x
                
                if ny < 0 || ny >= n || nx < 0 || nx >= m {
                    continue
                }
                
                if maze[ny][nx] == "1", visited[ny][nx] == -1 {
                    visited[ny][nx] = visited[pop.y][pop.x] + 1
                    q.append((ny, nx))
                }
            }
        }
    }
    
    bfs()
    print(visited[n - 1][m - 1])
}

/*
 [풀이] https://wikidocs.net/206353
  - 최소의 칸 수를 출력해야 하는 문제는 BFS로 해결
  - DFS는 방문할 수 있는 모든 곳을 계속 방문합니다. 그러다보니 최소 경로를 찾을 수 없습니다.
  - 반면 BFS로 탐색 시에는 방문 순서가 너비로 되기 때문에 최소 경로로 목적지에 도착할 수 있습니다.
  - visited 배열을 t/f로 하는 대신 방문수를 기록하도록 함
  - 간이 큐 만들기
   - while qStartIndex < q.count { ... }
   - deque 되면 qStartIndex + 1 하기
 
 -------
 
 N×M크기의 배열로 표현되는 미로가 있다.

 1    0    1    1    1    1
 1    0    1    0    1    0
 1    0    1    0    1    1
 1    1    1    0    1    1
 
 미로에서 1은 이동할 수 있는 칸을 나타내고, 0은 이동할 수 없는 칸을 나타낸다. 이러한 미로가 주어졌을 때, (1, 1)에서 출발하여 (N, M)의 위치로 이동할 때 지나야 하는 최소의 칸 수를 구하는 프로그램을 작성하시오. 한 칸에서 다른 칸으로 이동할 때, 서로 인접한 칸으로만 이동할 수 있다.

 위의 예에서는 15칸을 지나야 (N, M)의 위치로 이동할 수 있다. 칸을 셀 때에는 시작 위치와 도착 위치도 포함한다.

 입력
 첫째 줄에 두 정수 N, M(2 ≤ N, M ≤ 100)이 주어진다. 다음 N개의 줄에는 M개의 정수로 미로가 주어진다. 각각의 수들은 붙어서 입력으로 주어진다.

 출력
 첫째 줄에 지나야 하는 최소의 칸 수를 출력한다. 항상 도착위치로 이동할 수 있는 경우만 입력으로 주어진다.

 예제 입력 1
 4 6
 101111
 101010
 101011
 111011
 
 예제 출력 1
 15
 
 예제 입력 2
 4 6
 110110
 110110
 111111
 111101
 
 예제 출력 2
 9
 
 예제 입력 3
 2 25
 1011101110111011101110111
 1110111011101110111011101
 
 예제 출력 3
 38
 
 예제 입력 4
 7 7
 1011111
 1110001
 1000001
 1000001
 1000001
 1000001
 1111111
 
 예제 출력 4
 13
 */
