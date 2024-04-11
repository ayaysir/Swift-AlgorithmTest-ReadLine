//
//  2206.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/31/2024.
//
//  15: 벽 부수고 이동하기 https://www.acmicpc.net/problem/2206
//

import Foundation

/// 벽 부수고 이동하기 https://www.acmicpc.net/problem/2206
func Q_2206() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    let map = (0..<n).map { _ in readLine()!.map(String.init) }
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m), count: n)
    let dir4: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]

    var q = [(p: (y: 0, x: 0), d: 1, w: 0)], sIdx = 0
    var result = "-1"
    
    while sIdx < q.count {
        let pop = q[sIdx]
        sIdx += 1
        
        // 목표에 도착했을 경우
        if pop.p == (n - 1, m - 1) {
            result = "\(pop.d)"
            break
        }
        
        for dir in dir4 {
            let (ny, nx) = (pop.p.y + dir.y, pop.p.x + dir.x)
            
            if !(0..<n ~= ny) || !(0..<m ~= nx) {
                continue
            }
            
            // 다음 공간이 벽이고 부순적이 없으면서 방문안한곳
            if map[ny][nx] == "1", pop.w == 0, !visited[ny][nx][1] {
                visited[ny][nx][1] = true
                q.append(((ny, nx), pop.d + 1, 1))
            }
            
            // 다음 공간이 벽이 아니고 방문 안한곳
            if map[ny][nx] == "0", !visited[ny][nx][pop.w] {
                visited[ny][nx][pop.w] = true
                q.append(((ny, nx), pop.d + 1, pop.w))
            }
        }
    }
    
    print(result)
}

/// 벽 부수고 이동하기 https://www.acmicpc.net/problem/2206
func Q_2206_실패() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    let map = (0..<n).map { _ in readLine()!.map(String.init) }
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    let dir4: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]

    var q = [(p: (y: 0, x: 0), d: 1, b: false)], sIdx = 0
    var result = ""
    while sIdx < q.count {
        let pop = q[sIdx]
        sIdx += 1
        
        if pop.p == (n - 1, m - 1) {
            result = "\(pop.d)"
        }
        
        for dir in dir4 {
            let (ny, nx) = (pop.p.y + dir.y, pop.p.x + dir.x)
            
            if !(0..<n ~= ny) || !(0..<m ~= nx) {
                continue
            }
            
            if !visited[ny][nx] && map[ny][nx] == "0" {
                visited[ny][nx] = true
                q.append(((ny, nx), pop.d + 1, false))
            } else if map[ny][nx] == "1" && !pop.b {
                visited[ny][nx] = true
                // map[ny][nx] = "1"
                q.append(((ny, nx), pop.d + 1, true))
            }
        }
    }
    
    print(sIdx <= q.count ? q[sIdx...] : "nn")
    print(result.isEmpty ? "-1" : result)
}

/*
 [풀이] https://wtg-study.tistory.com/86
 - 최단 경로 => BFS
 - 이 문제에서는 벽을 부수었는지에 따른 여부를 알기 위해 3차원 배열로 만든다.
   - 벽을 안부순 세계, 벽을 부순 세계 2개로 나뉘는 것이다.
     visit[y][x][world]
     visit[y][x][0] : 벽을 부수지 않고 좌표(x, y)를 방문
     visit[y][x][1] : 벽을 부수고 좌표(x, y)를 방문
 - BFS 조건
   (1) 지금껏 가던 경로 중 벽을 부순 적이 없으면서 벽과 마주할 때(line 46 ~ line 51)
      - 방문 표시를 하는데, 벽을 부순 세계관에서만 유효하기 때문에 visited[ny][nx][1] 에만 방문표시
      - 이후 넣을 큐는 세계관이 지속되어야 하기 때문에 (벽을 이미 부쉈는데 도로 안부순 세계로 돌아갈 수는 없으므로) w: 1로 enqueue한다.
      - 벽은 한 번만 부술 수 있으며. w: 1은 다시 0으로 돌아오지 않는다.
   (2) 벽이 아닐 때(line 52 ~ line 57)
      - 이전 세계관을 이어받아 (pop.w) 벽이 아닌 경우 다음 구간을 방문처리 (visited[ny][nx][pop.w] = true)
 
 ---------
 
 문제
 N×M의 행렬로 표현되는 맵이 있다. 맵에서 0은 이동할 수 있는 곳을 나타내고, 1은 이동할 수 없는 벽이 있는 곳을 나타낸다. 당신은 (1, 1)에서 (N, M)의 위치까지 이동하려 하는데, 이때 최단 경로로 이동하려 한다. 최단경로는 맵에서 가장 적은 개수의 칸을 지나는 경로를 말하는데, 이때 시작하는 칸과 끝나는 칸도 포함해서 센다.

 만약에 이동하는 도중에 한 개의 벽을 부수고 이동하는 것이 좀 더 경로가 짧아진다면, 벽을 한 개 까지 부수고 이동하여도 된다.

 한 칸에서 이동할 수 있는 칸은 상하좌우로 인접한 칸이다.

 맵이 주어졌을 때, 최단 경로를 구해 내는 프로그램을 작성하시오.

 입력
 첫째 줄에 N(1 ≤ N ≤ 1,000), M(1 ≤ M ≤ 1,000)이 주어진다. 다음 N개의 줄에 M개의 숫자로 맵이 주어진다. (1, 1)과 (N, M)은 항상 0이라고 가정하자.

 출력
 첫째 줄에 최단 거리를 출력한다. 불가능할 때는 -1을 출력한다.

 예제 입력 1
 6 4
 0100
 1110
 1000
 0000
 0111
 0000
 예제 출력 1
 15
 
 예제 입력 2
 4 4
 0111
 1111
 1111
 1110
 예제 출력 2
 -1
 
 [반례]
 
2 4
0111
0010

ans: 5

---------

2 4
0111
0110

ans: -1

----------

1 1
0

ans: 1

----------

5 8
01000000
01010000
01010000
01010011
00010010
 
ans: 20

----------

6 7
0000000
0111111
0100010
0101010
0101010
0001010

ans: 12

---------

8 8
01000100
01010100
01010100
01010100
01010100
01010100
01010100
00010100

ans: 29

----------

3 3
011
111
110
 
ans: -1

-----------

3 6
010000
010111
000110

ans: 12

-----------

3 3
000
000
000

ans: 5

----------

4 4
0101
0101
0001
1110

ans: 7
*/
