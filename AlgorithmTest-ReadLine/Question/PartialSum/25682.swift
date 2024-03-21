//
//  25682.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/20/2024.
//
//  6: 체스판 다시 칠하기 2 https://www.acmicpc.net/problem/25682
//

// import Foundation

/// 체스판 다시 칠하기 2 https://www.acmicpc.net/problem/25682
func Q_25682() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (N, M, K) = (r[0], r[1], r[2])
    var boardStartWhite: [[Int]] = .init(repeating: .init(repeating: 0, count: M + 1), count: N + 1)
    var boardStartBlack: [[Int]] = .init(repeating: .init(repeating: 0, count: M + 1), count: N + 1)

    // 다시칠하기: 1, 다시안칠해도됨: 0
    for i in 1...N {
        let rl = readLine()!.map(String.init).enumerated()
        boardStartWhite[i] = [0] + rl.map { j, value in
            let j = j + 1 // 헷갈려서 +1
            
            // 둘 다 홀수면 흰색
            if (i % 2 == 1 && j % 2 == 1) || (i % 2 == 0 && j % 2 == 0) {
                return value == "W" ? 0 : 1
            } else {
                return value == "B" ? 0 : 1
            }
        }
        
        boardStartBlack[i] = [0] + rl.map { j, value in
            let j = j + 1 // 헷갈려서 +1
            
            // 둘 다 홀수면 검은색
            if (i % 2 == 1 && j % 2 == 1) || (i % 2 == 0 && j % 2 == 0) {
                return value == "B" ? 0 : 1
            } else {
                return value == "W" ? 0 : 1
            }
        }
    }

    // 누적합 구하기
    for i in 1...N {
        for j in 1...M {
            // 기준값의 왼쪽, 위쪽에서 값을 가져와 더하고, 대각선 방향을 뺌
            boardStartWhite[i][j] += boardStartWhite[i][j-1] + boardStartWhite[i-1][j] - boardStartWhite[i-1][j-1]
            boardStartBlack[i][j] += boardStartBlack[i][j-1] + boardStartBlack[i-1][j] - boardStartBlack[i-1][j-1]
            
        }
    }
    var minReplaced = Int.max // 최소 교체 회수

    // 인덱스 둘러보기: (i, j) = 범위의 가장 오른쪽 하단 인덱스
    for i in K...N {
        for j in K...M {
            let sumWhite = boardStartWhite[i][j] // dp[x2][y2]
            + boardStartWhite[i - K][j - K] // 🟪 꼬다리
            - boardStartWhite[i][j - K] // 🟩 세로 영역
            - boardStartWhite[i - K][j] // 🟧 가로 영역
            
            let sumBlack = boardStartBlack[i][j] // dp[x2][y2]
            + boardStartBlack[i - K][j - K] // 🟪 꼬다리
            - boardStartBlack[i][j - K] // 🟩 세로 영역
            - boardStartBlack[i - K][j] // 🟧 가로 영역
            
            minReplaced = min(minReplaced, sumWhite, sumBlack)
        }
    }

    print(minReplaced)
}

/*
 [풀이]
 1. 문제에 주어진 체스판과 원본 체스판(흰/검 시작으로 나눠서)을 비교해서 색칠을 해야되는 부분은 1, 안해도 되는 부분은 0을 한다.
  - 나중에 구간합을 구해서 판단하기 위함
 2. (1)번으로 만들어진 배열을 2차원으로 누적합(prefixSum) 시킨다. (=> 11660번 문제 풀이 참고)
 3. (2)번으로 만들어진 누적합 배열을 K*K 칸마다 순회하면서 범위의 합 (=> 교체 횟수)를 구한 뒤 최소값을 저장한다.
  - 흰색 시작 케이스 배열 + 검은색 시작 케이스 배열 각각 순회
  - 예) N = 4, M = 4, K = 3 의 배열을 순회
 🟧🟧🟧⬜️       ⬜️🟧🟧🟧       ⬜️⬜️⬜️⬜️       ⬜️⬜️⬜️⬜️
 🟧🟧🟧⬜️       ⬜️🟧🟧🟧       🟧🟧🟧⬜️       ⬜️🟧🟧🟧
 🟧🟧🟧⬜️       ⬜️🟧🟧🟧       🟧🟧🟧⬜️       ⬜️🟧🟧🟧
 ⬜️⬜️⬜️⬜️       ⬜️⬜️⬜️⬜️       🟧🟧🟧⬜️       ⬜️🟧🟧🟧
 
 이런식으로 순회하면서 주황색 영역의 구간합이 가장 작은 값이 최종 정답이다.
 
 ---
 
 문제
 지민이는 자신의 저택에서 MN개의 단위 정사각형으로 나누어져 있는 M×N 크기의 보드를 찾았다. 어떤 정사각형은 검은색으로 칠해져 있고, 나머지는 흰색으로 칠해져 있다. 지민이는 이 보드를 잘라서 K×K 크기의 체스판으로 만들려고 한다.

 체스판은 검은색과 흰색이 번갈아서 칠해져 있어야 한다. 구체적으로, 각 칸이 검은색과 흰색 중 하나로 색칠되어 있고, 변을 공유하는 두 개의 사각형은 다른 색으로 칠해져 있어야 한다. 따라서 이 정의를 따르면 체스판을 색칠하는 경우는 두 가지뿐이다. 하나는 맨 왼쪽 위 칸이 흰색인 경우, 하나는 검은색인 경우이다.

 보드가 체스판처럼 칠해져 있다는 보장이 없어서, 지민이는 K×K 크기의 체스판으로 잘라낸 후에 몇 개의 정사각형을 다시 칠해야겠다고 생각했다. 당연히 K×K 크기는 아무데서나 골라도 된다. 지민이가 다시 칠해야 하는 정사각형의 최소 개수를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 정수 N, M, K가 주어진다. 둘째 줄부터 N개의 줄에는 보드의 각 행의 상태가 주어진다. B는 검은색이며, W는 흰색이다.

 출력
 첫째 줄에 지민이가 잘라낸 K×K 보드를 체스판으로 만들기 위해 다시 칠해야 하는 정사각형 개수의 최솟값을 출력한다.

 제한
 1 ≤ N, M ≤ 2000
 1 ≤ K ≤ min(N, M)
 
 예제 입력 1
 4 4 3
 BBBB
 BBBB
 BBBW
 BBWB
 예제 출력 1
 2
 
 예제 입력 2
 8 8 8
 WBWBWBWB
 BWBWBWBW
 WBWBWBWB
 BWBBBWBW
 WBWBWBWB
 BWBWBWBW
 WBWBWBWB
 BWBWBWBW
 예제 출력 2
 1
 
 예제 입력 3
 10 13 10
 BBBBBBBBWBWBW
 BBBBBBBBBWBWB
 BBBBBBBBWBWBW
 BBBBBBBBBWBWB
 BBBBBBBBWBWBW
 BBBBBBBBBWBWB
 BBBBBBBBWBWBW
 BBBBBBBBBWBWB
 WWWWWWWWWWBWB
 WWWWWWWWWWBWB
 예제 출력 3
 30
 
 예제 입력 4
 9 23 9
 BBBBBBBBBBBBBBBBBBBBBBB
 BBBBBBBBBBBBBBBBBBBBBBB
 BBBBBBBBBBBBBBBBBBBBBBB
 BBBBBBBBBBBBBBBBBBBBBBB
 BBBBBBBBBBBBBBBBBBBBBBB
 BBBBBBBBBBBBBBBBBBBBBBB
 BBBBBBBBBBBBBBBBBBBBBBB
 BBBBBBBBBBBBBBBBBBBBBBB
 BBBBBBBBBBBBBBBWWWWWWWW
 예제 출력 4
 40
 */
