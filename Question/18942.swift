//
//  18942.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/09/21.
//

import Foundation

/*
 문제
 리듬게임 국가대표, 월드컵 준결승의 주역인 고인물 카루나는 리듬게임을 제패하기 위해 새로운 리듬게임을 시작했다. 이 게임은 굉장히 특이한 점수 체계를 가지고 있다.

 이 게임은 콤보라는 시스템을 가지고 있다. 잘 모를 수도 있는 사람들을 위해 설명하자면, 곡이 시작할 때의 콤보는 0이고, 각 노트마다 노트를 치면 콤보가 1 증가하고, 노트를 치지 못하면 콤보가 끊기며 0으로 돌아간다. 먼저 나온 노트를 치거나 놓치기 전에는 그 노트를 칠 수 없다.

 점수의 계산은 각 노트에 대한 점수 Ai와 콤보에 대한 점수 Cj, 콤보가 끊길 때의 점수 P에 따라 계산된다. 콤보가 클수록 콤보에 대한 점수 Cj는 작아지며, i번째 노트를 친 후에 콤보가 j가 된다면 Ai × Cj점을 얻는다. 만약 노트를 치지 못했다면 그 노트에 대한 점수는 없다.

 또한, 노트를 놓치거나 곡이 끝나서 콤보가 끊길 때마다 P점을 추가로 얻는다. 즉, 콤보가 1 이상에서 0으로 바뀌거나 곡이 끝날 때 콤보가 1 이상일 경우 점수를 얻는다.

 카루나는 엄청난 고인물이기 때문에 곡과는 상관 없이 최대 K개의 노트를 골라서 칠 수 있다. 즉, 노트가 K개 이하라면 아무 노트나 선택해서 원하는 대로 칠 수 있다.

 카루나가 칠 곡의 정보가 주어질 때, 얻을 수 있는 최대 점수를 구해 주자!

 입력
 첫째 줄에는 세 정수 N, K, P가 공백으로 구분되어 주어진다. N은 곡에 있는 노트의 수를 의미한다.

 둘째 줄에는 N개의 정수가 공백으로 구분되어 주어진다. i번째의 수는 i번째 노트에 대한 점수 Ai를 의미한다.

 셋째 줄에는 N개의 정수가 공백으로 구분되어 주어진다. j번째의 수는 콤보 j에 대한 점수 Cj를 의미한다.

 출력
 카루나가 얻을 수 있는 점수의 최댓값을 출력한다.

 제한
 1 ≤ N, K ≤ 2,000
 -109 ≤ P ​≤ 109
 0 ≤ Ai ≤ 105
 -105 ≤ Cj ≤ 105
 1 ≤ j ≤ N-1를 만족하는 모든 정수 j에 대해, Cj ≥ Cj+1임이 보장된다.
 
 예제 입력 1
 5 5 1
 5 4 3 2 1
 5 4 3 2 1
 
 예제 출력 1
 57
 1번째, 2번째, 4번째, 5번째 노트를 치게 되면 카루나가 얻게 되는 점수는 5×5+4×4+1+2×5+1×4+1=57점을 얻을 수 있으며, 더 높은 점수를 얻는 것은 불가능하다.
 
 ====================================================================
 
 이 문제를 풀기 위해서는 다이나믹 프로그래밍(Dynamic Programming) 알고리즘을 사용할 수 있습니다. 다음은 이 문제를 해결하는 Python 코드입니다.

 python
 Copy code
 import sys

 def solve(N, K, P, A, C):
     dp = [[-sys.maxsize] * (K + 1) for _ in range(N + 1)]
     dp[0][0] = 0

     for i in range(1, N + 1):
         for j in range(K + 1):
             combo = 0
             max_score = dp[i - 1][j]  # Not choosing the i-th note

             for k in range(1, min(j + 1, i) + 1):
                 combo += C[i - k]
                 max_score = max(max_score, dp[i - k][j - k] + combo * A[i - k])

             dp[i][j] = max_score + P

     return max(dp[N])

 # 입력 파싱
 N, K, P = map(int, input().split())
 A = [0] + list(map(int, input().split()))
 C = [0] + list(map(int, input().split()))

 # 문제 해결 및 결과 출력
 result = solve(N, K, P, A, C)
 print(result)
 이 코드는 다이나믹 프로그래밍을 활용하여 주어진 조건에서 얻을 수 있는 최대 점수를 계산합니다. DP 테이블을 이용하여 문제를 효과적으로 해결합니다. 입력값을 파싱한 후 solve 함수를 호출하여 최대 점수를 계산하고 출력합니다.
 */

func Q_18942() {
    let input1: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = input1[0]
    let K = input1[1]
    let P = input1[2]
    
    let A: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let C: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    // dp[i][j]는 i번째 노트까지 골라서 j번 콤보를 사용했을 때 얻을 수 있는 최대 점수
    var dp = Array(repeating: Array(repeating: Int.min, count: K + 1), count: N + 1)

}

                                                                        
