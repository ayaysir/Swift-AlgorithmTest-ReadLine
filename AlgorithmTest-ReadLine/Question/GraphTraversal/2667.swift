//
//  2667.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/31/2024.
//
//  7: 단지번호붙이기 https://www.acmicpc.net/problem/2667
//

import Foundation

/// 단지번호붙이기 https://www.acmicpc.net/problem/2667
func Q_2667() {
    let n = Int(readLine()!)!
    let complex = (0..<n).map { _ in readLine()!.map(String.init) }
    var visited = Array(repeating: Array(repeating: -1, count: n), count: n)
    
    var innerCount = 0
    var result = [Int]()
    func dfs(_ y: Int, _ x: Int) {
        // 개별 구역 또는 전체의 카운트는 여기서
        // - 구역별로 카운트하는 경우 구역이 끝나면 리셋
        visited[y][x] = 1
        innerCount += 1
        
        let dir4: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        
        for dir in dir4 {
            let ny = y + dir.y
            let nx = x + dir.x
            
            if ny < 0 || ny >= n || nx < 0 || nx >= n {
                continue
            }
            
            if complex[ny][nx] == "1", visited[ny][nx] == -1 {
                dfs(ny, nx)
            }
        }
    }
    
    var count = 0
    for i in 0..<n {
        for j in 0..<n {
            if complex[i][j] == "1", visited[i][j] == -1 {
                count += 1
                dfs(i, j)
                result.append(innerCount)
                innerCount = 0
            }
        }
    }
    
    print(count)
    print(result.sorted().map(String.init).joined(separator: "\n"))
}

/*
 [풀이]
 - DFS에서 구역 수 세기
   - 솔루션의 2중 for문에서 bfs 소환하기 전에 카운트
 - DFS에서 각 구역의 셀 개수 세기
   - visited에 기록할 때 카운트 1 증가
   - 솔루션의 2중 for문에서 카운터 리셋
 - DFS에서 전체 셀 개수 세기
   - visited에 기록할 때 카운트 1 증가 (리셋하지 않음)
 
 [참고]
 출처: KOI 1996 > 초등부 1번
 나 초등학생때 덧셈뺄셈도 제대로 못했는데 다른애들은 이런거풀었음?
 
 ---------
 
 문제
 <그림 1>과 같이 정사각형 모양의 지도가 있다. 1은 집이 있는 곳을, 0은 집이 없는 곳을 나타낸다. 철수는 이 지도를 가지고 연결된 집의 모임인 단지를 정의하고, 단지에 번호를 붙이려 한다. 여기서 연결되었다는 것은 어떤 집이 좌우, 혹은 아래위로 다른 집이 있는 경우를 말한다. 대각선상에 집이 있는 경우는 연결된 것이 아니다. <그림 2>는 <그림 1>을 단지별로 번호를 붙인 것이다. 지도를 입력하여 단지수를 출력하고, 각 단지에 속하는 집의 수를 오름차순으로 정렬하여 출력하는 프로그램을 작성하시오.

 ⬜️1️⃣1️⃣⬜️2️⃣⬜️⬜️
 ⬜️1️⃣1️⃣⬜️2️⃣⬜️2️⃣
 1️⃣1️⃣1️⃣⬜️2️⃣⬜️2️⃣
 ⬜️⬜️⬜️⬜️2️⃣2️⃣2️⃣
 ⬜️3️⃣⬜️⬜️⬜️⬜️⬜️
 ⬜️3️⃣3️⃣3️⃣3️⃣3️⃣⬜️
 ⬜️3️⃣3️⃣3️⃣⬜️⬜️⬜️

 입력
 첫 번째 줄에는 지도의 크기 N(정사각형이므로 가로와 세로의 크기는 같으며 5≤N≤25)이 입력되고, 그 다음 N줄에는 각각 N개의 자료(0혹은 1)가 입력된다.

 출력
 첫 번째 줄에는 총 단지수를 출력하시오. 그리고 각 단지내 집의 수를 오름차순으로 정렬하여 한 줄에 하나씩 출력하시오.

 예제 입력 1
 7
 0110100
 0110101
 1110101
 0000111
 0100000
 0111110
 0111000
 
 예제 출력 1
 3
 7
 8
 9
 */
