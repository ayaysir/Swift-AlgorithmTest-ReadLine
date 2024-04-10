//
//  7576.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/31/2024.
//
//  12: 토마토 https://www.acmicpc.net/problem/7576
//

import Foundation

/// 토마토 https://www.acmicpc.net/problem/7576
func Q_7576() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[1], r[0])
    
    var box = (0..<n).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
    
    let dir4: [(y: Int, x: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var q: [(y: Int, x: Int)] = [], sIdx = 0
    
    // 큐에 익은 토마토 넣기
    for i in 0..<n {
        for j in 0..<m {
            if box[i][j] == 1 {
                q.append((i, j))
            }
        }
    }
    
    while sIdx < q.count {
        let pop = q[sIdx]
        sIdx += 1
        
        for dir in dir4 {
            let (ny, nx) = (pop.y + dir.y, pop.x + dir.x)
            
            if ny < 0 || ny >= n || nx < 0 || nx >= m {
                continue
            }
            
            if box[ny][nx] == -1 {
                continue
            }
            
            if box[ny][nx] == 0 {
                box[ny][nx] = box[pop.y][pop.x] + 1
                q.append((ny, nx))
            }
        }
    }
    
    print(judgeStatus())
    
    func judgeStatus() -> Int {
        var maxValue = Int.min
        
        for i in 0..<n {
            for j in 0..<m {
                if box[i][j] == 0 {
                    return -1
                }
                
                maxValue = max(maxValue, box[i][j])
            }
        }
        
        return maxValue == 1 ? 0 : maxValue - 1
    }
}

/*
 [풀이] https://jdselectron.tistory.com/55
 - '최소' 기간을 물어봤으므로 BFS
 - 익은 토마토(들)을 미리 큐에 넣는다.
 - 범위를 벗어나거나 -1(못가는곳)이면 continue
 - 다음 타깃이 아직 익지 않은 토마토(0)인 경우
   출발지에서 +1을 하고 다음 타깃으로 넘어간다. (날짜를 1 더한 효과)
 
 [판단]
 - box의 최종 상태를 보고 판단해야 한다.
 - 문제에서 '전체가 익기까지의 날'이라고 했으니 토마토 중에 0이 있다면 안익은 것이므로 (-1)을 리턴한다.
   - 안익은 토마토가 있을 수 있는 이유는 갈 수 없는 곳의 존재 때문이다.
 - 초기값이 1인데 최종 박스에서 가장 큰 토마토가 1이라면 첫날부터 익어있었던 것이므로 (0)을 리턴한다.
 - 그 외의 경우라면 (가장 큰 값 - 1)을 리턴한다ㅣ
   - 기본 값이 1부터 시작하므로 8이 최대값이라면 다 익기까지 7일이 걸린 것이다.
 
 ------------
 
 철수의 토마토 농장에서는 토마토를 보관하는 큰 창고를 가지고 있다. 토마토는 아래의 그림과 같이 격자 모양 상자의 칸에 하나씩 넣어서 창고에 보관한다.
 
 창고에 보관되는 토마토들 중에는 잘 익은 것도 있지만, 아직 익지 않은 토마토들도 있을 수 있다. 보관 후 하루가 지나면, 익은 토마토들의 인접한 곳에 있는 익지 않은 토마토들은 익은 토마토의 영향을 받아 익게 된다. 하나의 토마토의 인접한 곳은 왼쪽, 오른쪽, 앞, 뒤 네 방향에 있는 토마토를 의미한다. 대각선 방향에 있는 토마토들에게는 영향을 주지 못하며, 토마토가 혼자 저절로 익는 경우는 없다고 가정한다. 철수는 창고에 보관된 토마토들이 며칠이 지나면 다 익게 되는지, 그 최소 일수를 알고 싶어 한다.

 토마토를 창고에 보관하는 격자모양의 상자들의 크기와 익은 토마토들과 익지 않은 토마토들의 정보가 주어졌을 때, 며칠이 지나면 토마토들이 모두 익는지, 그 최소 일수를 구하는 프로그램을 작성하라. 단, 상자의 일부 칸에는 토마토가 들어있지 않을 수도 있다.

 입력
 첫 줄에는 상자의 크기를 나타내는 두 정수 M,N이 주어진다. M은 상자의 가로 칸의 수, N은 상자의 세로 칸의 수를 나타낸다. 단, 2 ≤ M,N ≤ 1,000 이다. 둘째 줄부터는 하나의 상자에 저장된 토마토들의 정보가 주어진다. 즉, 둘째 줄부터 N개의 줄에는 상자에 담긴 토마토의 정보가 주어진다. 하나의 줄에는 상자 가로줄에 들어있는 토마토의 상태가 M개의 정수로 주어진다. 정수 1은 익은 토마토, 정수 0은 익지 않은 토마토, 정수 -1은 토마토가 들어있지 않은 칸을 나타낸다.

 토마토가 하나 이상 있는 경우만 입력으로 주어진다.

 출력
 여러분은 토마토가 모두 익을 때까지의 최소 날짜를 출력해야 한다. 만약, 저장될 때부터 모든 토마토가 익어있는 상태이면 0을 출력해야 하고, 토마토가 모두 익지는 못하는 상황이면 -1을 출력해야 한다.

 예제 입력 1
 6 4
 0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 1
 예제 출력 1
 8
 
 예제 입력 2
 6 4
 0 -1 0 0 0 0
 -1 0 0 0 0 0
 0 0 0 0 0 0
 0 0 0 0 0 1
 예제 출력 2
 -1
 
 예제 입력 3
 6 4
 1 -1 0 0 0 0
 0 -1 0 0 0 0
 0 0 0 0 -1 0
 0 0 0 0 -1 1
 예제 출력 3
 6
 
 예제 입력 4
 5 5
 -1 1 0 0 0
 0 -1 -1 -1 0
 0 -1 -1 -1 0
 0 -1 -1 -1 0
 0 0 0 0 0
 예제 출력 4
 14
 
 예제 입력 5
 2 2
 1 -1
 -1 1
 예제 출력 5
 0
 */