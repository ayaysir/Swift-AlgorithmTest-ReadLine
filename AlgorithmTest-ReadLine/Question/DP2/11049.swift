//
//  11049.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/27/2024.
//
//  2: 행렬 곱셈 순서 https://www.acmicpc.net/problem/11049
//

import Foundation

/// 행렬 곱셈 순서 https://www.acmicpc.net/problem/11049
/// 92ms
func Q_11049() {
    let n = Int(readLine()!)!
    // let mats: [(Int, Int)] = (0..<n).map { _ in
    //     let matrix = readLine()!.split(separator: " ").map { Int($0)! }
    //     return (matrix[0], matrix[1])
    // }
    var mats = [(Int, Int)]()
    for _ in 0..<n {
        let matrix = readLine()!.split(separator: " ").map { Int($0)! }
        mats.append((matrix[0], matrix[1]))
    }

    var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

    for i in 1..<n {
        for start in 0..<n-i {
            let end = start + i
            var target = Int.max
            // dp[start][end] = .max // 시간 많이걸림
            
            for mid in start..<end {
                target = min(
                    target,
                    dp[start][mid] + dp[mid+1][end]
                    + (mats[start].0 * mats[end].1 * mats[mid].1)
                )
            }
            
            dp[start][end] = target
        }
    }

    print(dp[0][n-1])
}

/// 행렬 곱셈 순서 https://www.acmicpc.net/problem/11049
/// 744ms -
func Q_11049_() {
    let n = Int(readLine()!)!
    let matrices = (0..<n).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
    var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

    for i in 0..<n-1 {
        for start in 0..<(n-1-i) {
            let end = start + 1 + i
            dp[start][end] = .max

            for mid in start..<end {
                dp[start][end] = min(
                    dp[start][end],
                    dp[start][mid] + dp[mid+1][end]
                    + (matrices[start][0] * matrices[mid][1] * matrices[end][1]))
            }
        }
    }

    print(dp[0][n-1])
}

/*
 [풀이] https://ddiyeon.tistory.com/72
 기본적인 틀은 11066(파일 합치기) 문제와 유사
 
 - (5,3) (3,2) (2,6) 이 주어진 경우 다음과 같은 테이블 생성
 +---+----+---+---+
 |   | 3  | 2 | 6 |
 +===+====+===+===+
 | 5 ║ ↖↑ |   |   |
 +---+----+---+---+
 | 3 ║    |   |   |
 +---+----+---+---+
 | 2 ║    |   |   |
 +---+----+---+---+
 
 - 5로 시작해서 2로 끝나는 행렬의 연산횟수
 +---+---+---+---+
 |   | 3 | 2 | 6 |
 +===+===+===+===+
 | 5 ║ 0 |   |   |       1가지
 +---+---+---+---+       = 5*3 연산횟수 + 3*2 연산횟수 + 5*3*2
 | 3 ║   | 0 |   |       = 0 + 0 + 30
 +---+---+---+---+
 | 2 ║   |   | 0 |
 +---+---+---+---+
    (5*3)(3*2)(2*6)
 
 - 5로 시작해서 6으로 끝나는 행렬의 연산횟수
   - 1: [(3*2) (2*6)] (5*3)
   - 2: [(5*3) (3*2)] (2*6)
 
 +---+---+----+----+
 |   | 3 |  2 |  6 |
 +===+===+====+====+
 | 5 ║ 0 | 30 |    |  = min (1) 5*3연산횟수(=>0) + 3*6연산횟수(=>3*2*6=36) + 5*3*6(=>90) = 126
 +---+---+----+----+        (2) 5*2연산횟수(=>5*3*2=30) + 2*6연산횟수(=>0) + 5*2*6(=>60) = 90
 | 3 ║   |  0 | 60 |
 +---+---+----+----+
 | 2 ║   |    |  0 |
 +---+---+----+----+
 
 --------
 
 문제
 크기가 N×M인 행렬 A와 M×K인 B를 곱할 때 필요한 곱셈 연산의 수는 총 N×M×K번이다. 행렬 N개를 곱하는데 필요한 곱셈 연산의 수는 행렬을 곱하는 순서에 따라 달라지게 된다.

 예를 들어, A의 크기가 5×3이고, B의 크기가 3×2, C의 크기가 2×6인 경우에 행렬의 곱 ABC를 구하는 경우를 생각해보자.

 AB를 먼저 곱하고 C를 곱하는 경우 (AB)C에 필요한 곱셈 연산의 수는 5×3×2 + 5×2×6 = 30 + 60 = 90번이다.
 BC를 먼저 곱하고 A를 곱하는 경우 A(BC)에 필요한 곱셈 연산의 수는 3×2×6 + 5×3×6 = 36 + 90 = 126번이다.
 같은 곱셈이지만, 곱셈을 하는 순서에 따라서 곱셈 연산의 수가 달라진다.

 행렬 N개의 크기가 주어졌을 때, 모든 행렬을 곱하는데 필요한 곱셈 연산 횟수의 최솟값을 구하는 프로그램을 작성하시오. 입력으로 주어진 행렬의 순서를 바꾸면 안 된다.

 입력
 첫째 줄에 행렬의 개수 N(1 ≤ N ≤ 500)이 주어진다.

 둘째 줄부터 N개 줄에는 행렬의 크기 r과 c가 주어진다. (1 ≤ r, c ≤ 500)

 항상 순서대로 곱셈을 할 수 있는 크기만 입력으로 주어진다.

 출력
 첫째 줄에 입력으로 주어진 행렬을 곱하는데 필요한 곱셈 연산의 최솟값을 출력한다. 정답은 231-1 보다 작거나 같은 자연수이다. 또한, 최악의 순서로 연산해도 연산 횟수가 231-1보다 작거나 같다.

 예제 입력 1
 3
 5 3
 3 2
 2 6
 
 예제 출력 1
 90
 */
