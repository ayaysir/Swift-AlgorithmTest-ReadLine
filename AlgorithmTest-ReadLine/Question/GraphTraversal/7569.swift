//
//  7569.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/31/2024.
//
//  13: 토마토 https://www.acmicpc.net/problem/7569
//

import Foundation

/// 토마토 https://www.acmicpc.net/problem/7569
func Q_7569() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m, h) = (r[1], r[0], r[2])
    
    /// 3차원 배열 넣기
    var boxes: [[[Int]]] = .init()
    for _ in 0..<h {
        let box = (0..<n).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
        boxes.append(box)
    }
    
    let dirs: [(z: Int, y: Int, x: Int)] = [(0, 0, 1), (0, 1, 0), (0, 0, -1), (0, -1, 0), (1, 0, 0), (-1, 0, 0)]
    var q: [(z: Int, y: Int, x: Int)] = [], sIdx = 0
    
    // 큐에 익은 토마토 넣기
    for f in 0..<h {
        for i in 0..<n {
            for j in 0..<m {
                if boxes[f][i][j] == 1 {
                    q.append((f, i, j))
                }
            }
        }
    }
    
    while sIdx < q.count {
        let pop = q[sIdx]
        sIdx += 1
        
        for dir in dirs {
            let (nz, ny, nx) = (pop.z + dir.z, pop.y + dir.y, pop.x + dir.x)
            
            if ny < 0 || ny >= n || nx < 0 || nx >= m || nz < 0 || nz >= h {
                continue
            }
            
            if boxes[nz][ny][nx] == -1 {
                continue
            }
            
            if boxes[nz][ny][nx] == 0 {
                boxes[nz][ny][nx] = boxes[pop.z][pop.y][pop.x] + 1
                q.append((nz, ny, nx))
            }
        }
    }
    
    print(judgeStatus())
    
    func judgeStatus() -> Int {
        var maxValue = Int.min
        
        for f in 0..<h {
            for i in 0..<n {
                for j in 0..<m {
                    if boxes[f][i][j] == 0 {
                        return -1
                    }
                    maxValue = max(maxValue, boxes[f][i][j])
                }
            }
        }
        
        return maxValue == 1 ? 0 : maxValue - 1
    }
}

/*
 [풀이]
 - 7576 문제와 동일
 - 2차원 배열 => 3차원 배열로 변경 / 위, 아래 이동 추가
 
 [3차원 배열]
 - 3차원의 깡통 배열을 만든다.
 - n 카운트만큼 2차원배열을 만들고, h 수에 따라 append한다.
 - 사용 방법은 array[z][y][x] 순으로 사용
 
 -----------
 
 철수의 토마토 농장에서는 토마토를 보관하는 큰 창고를 가지고 있다. 토마토는 아래의 그림과 같이 격자모양 상자의 칸에 하나씩 넣은 다음, 상자들을 수직으로 쌓아 올려서 창고에 보관한다.

 창고에 보관되는 토마토들 중에는 잘 익은 것도 있지만, 아직 익지 않은 토마토들도 있을 수 있다. 보관 후 하루가 지나면, 익은 토마토들의 인접한 곳에 있는 익지 않은 토마토들은 익은 토마토의 영향을 받아 익게 된다. 하나의 토마토에 인접한 곳은 위, 아래, 왼쪽, 오른쪽, 앞, 뒤 여섯 방향에 있는 토마토를 의미한다. 대각선 방향에 있는 토마토들에게는 영향을 주지 못하며, 토마토가 혼자 저절로 익는 경우는 없다고 가정한다. 철수는 창고에 보관된 토마토들이 며칠이 지나면 다 익게 되는지 그 최소 일수를 알고 싶어 한다.

 토마토를 창고에 보관하는 격자모양의 상자들의 크기와 익은 토마토들과 익지 않은 토마토들의 정보가 주어졌을 때, 며칠이 지나면 토마토들이 모두 익는지, 그 최소 일수를 구하는 프로그램을 작성하라. 단, 상자의 일부 칸에는 토마토가 들어있지 않을 수도 있다.

 입력
 첫 줄에는 상자의 크기를 나타내는 두 정수 M,N과 쌓아올려지는 상자의 수를 나타내는 H가 주어진다. M은 상자의 가로 칸의 수, N은 상자의 세로 칸의 수를 나타낸다. 단, 2 ≤ M ≤ 100, 2 ≤ N ≤ 100, 1 ≤ H ≤ 100 이다. 둘째 줄부터는 가장 밑의 상자부터 가장 위의 상자까지에 저장된 토마토들의 정보가 주어진다. 즉, 둘째 줄부터 N개의 줄에는 하나의 상자에 담긴 토마토의 정보가 주어진다. 각 줄에는 상자 가로줄에 들어있는 토마토들의 상태가 M개의 정수로 주어진다. 정수 1은 익은 토마토, 정수 0 은 익지 않은 토마토, 정수 -1은 토마토가 들어있지 않은 칸을 나타낸다. 이러한 N개의 줄이 H번 반복하여 주어진다.

 토마토가 하나 이상 있는 경우만 입력으로 주어진다.

 출력
 여러분은 토마토가 모두 익을 때까지 최소 며칠이 걸리는지를 계산해서 출력해야 한다. 만약, 저장될 때부터 모든 토마토가 익어있는 상태이면 0을 출력해야 하고, 토마토가 모두 익지는 못하는 상황이면 -1을 출력해야 한다.

 예제 입력 1
 5 3 1
 0 -1 0 0 0
 -1 -1 0 1 1
 0 0 0 1 1
 예제 출력 1
 -1
 
 예제 입력 2
 5 3 2
 0 0 0 0 0
 0 0 0 0 0
 0 0 0 0 0
 0 0 0 0 0
 0 0 1 0 0
 0 0 0 0 0
 예제 출력 2
 4
 
 예제 입력 3
 4 3 2
 1 1 1 1
 1 1 1 1
 1 1 1 1
 1 1 1 1
 -1 -1 -1 -1
 1 1 1 -1
 예제 출력 3
 0
 */
