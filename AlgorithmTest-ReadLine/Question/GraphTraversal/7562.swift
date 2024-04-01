//
//  7562.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/31/2024.
//
//  11: 나이트의 이동 https://www.acmicpc.net/problem/7562
//

import Foundation

/// 나이트의 이동 https://www.acmicpc.net/problem/7562
func Q_7562() {
    for _ in 0..<Int(readLine()!)! {
        let n = Int(readLine()!)!
        let knightPos = readLine()!.split(separator: " ").map { Int($0)! }
        let targetPos = readLine()!.split(separator: " ").map { Int($0)! }
        var board = Array(repeating: Array(repeating: false, count: n), count: n)
        
        // BFS
        let dirs: [(y: Int, x: Int)] = [
            (-1, -2),
            (-2, -1),
            (-1, 2),
            (-2, 1),
            (1, -2),
            (2, -1),
            (1, 2),
            (2, 1),
        ]
        
        var q = [(p: (y: knightPos[0], x: knightPos[1]), d: 0)], sIdx = 0
        
        while sIdx < q.count {
            let pop = q[sIdx]
            sIdx += 1
            
            if pop.p == (targetPos[0], targetPos[1]) {
                print(pop.d)
                break
            }
            
            for dir in dirs {
                let (ny, nx) = (pop.p.y + dir.y, pop.p.x + dir.x)
                
                if ny < 0 || ny >= n || nx < 0 || nx >= n {
                    continue
                }
                
                if !board[ny][nx] {
                    board[ny][nx] = true
                    q.append(((ny, nx), pop.d + 1))
                }
            }
        }
    }
}

/*
 [풀이]
 - '최소' 거리를 물어봤으므로 BFS
 - 거리 정보는 큐에 들어갈 튜플에 저장
 - 이중 튜플 가능 (코드 참조)
 
 [BFS로 맵에서 최소거리 구하기]
 1. 방향 정보 배열 추가
 2. 큐(간이 큐 또는 정식 큐) 추가
   - 간이 큐를 사용하는 경우 스타트 인덱스도 추가
 3. !q.isEmpty (또는 sIdx < q.count) while문 추가
 4. 큐에서 맨 앞 꺼내기 (dequeue)
   - 큐에는 위치 정보, 거리 정보를 튜플 등의 형태로 저장
   - ((y, x), 거리) 등의 이중 튜플 가능
 5. 꺼낸 것의 좌표가 목표 좌표와 일치하는 경우 distance 표시하고 종료(break)
 6. 방향 정보를 돌면서
   (1) 다음 방향 찾기
   (2) 맵 범위를 벗어나면 continue
   (3) 방문한적이 없으면 방문 = true로 하고, 큐에 새로운 좌표, 거리정보를 넣기 (enqueue)
 
 --------
 
 문제
 체스판 위에 한 나이트가 놓여져 있다. 나이트가 이동하려고 하는 칸이 주어진다. 나이트는 몇 번 움직이면 이 칸으로 이동할 수 있을까?

 입력
 입력의 첫째 줄에는 테스트 케이스의 개수가 주어진다.

 각 테스트 케이스는 세 줄로 이루어져 있다. 첫째 줄에는 체스판의 한 변의 길이 l(4 ≤ l ≤ 300)이 주어진다. 체스판의 크기는 l × l이다. 체스판의 각 칸은 두 수의 쌍 {0, ..., l-1} × {0, ..., l-1}로 나타낼 수 있다. 둘째 줄과 셋째 줄에는 나이트가 현재 있는 칸, 나이트가 이동하려고 하는 칸이 주어진다.

 출력
 각 테스트 케이스마다 나이트가 최소 몇 번만에 이동할 수 있는지 출력한다.

 예제 입력 1
 3
 8
 0 0
 7 0
 100
 0 0
 30 50
 10
 1 1
 1 1
 
 예제 출력 1
 5
 28
 0
 
 */



