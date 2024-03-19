//
//  2579.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/18/24.
//

import Foundation

func Q_2579_() {
    let n = Int(readLine()!)!
    
    var stairs = Array(repeating: 0, count: n + 1)
    var dp = Array(repeating: 0, count: n + 1)
    
    for i in 1...n {
        stairs[i] = Int(readLine()!)!
    }
    
    dp[1] = stairs[1]
    if n >= 2 { dp[2] = stairs[1] + stairs[2] }
    if n >= 3 { dp[3] = max(stairs[1], stairs[2]) + stairs[3] }
    if n >= 4 {
        for i in 4...n {
            dp[i] = stairs[i] + max(dp[i - 2], stairs[i - 1] + dp[i - 3])
        }
    }
    
    print(dp.last!)
}

func Q_2579() {
    let n = Int(readLine()!)!
    
    var stairs = Array(repeating: 0, count: 301)
    var dp = Array(repeating: 0, count: 301)
    
    for i in 1...n {
        stairs[i] = Int(readLine()!)!
    }
    
    dp[1] = stairs[1]
    dp[2] = stairs[1] + stairs[2]
    dp[3] = max(stairs[1], stairs[2]) + stairs[3]
    
    // stride는 from보다 n이 작아도 런타임 에러를 발생시키지 않음
    for i in stride(from: 4, through: n, by: 1) {
        dp[i] = stairs[i] + max(dp[i - 2], stairs[i - 1] + dp[i - 3])
    }
    
    print(dp[n])
}

/*
 [풀이] https://s0ojin.tistory.com/4
 - 최대값을 저장하는 배열 dp 생성

 1. 계단이 1개일 때 dp[1] = input[1]
 2. 계단이 2개일 때 dp[2] = input[1] + input[2]
  - 계단 2개를 모두 밟는 것이 최대값이므로, 두개를 합한 값이 늘 최대값이다.
 3. 계단이 3개일 때 dp[3] = input[3] + max(input[1], input[2])
  - 마지막 계단을 무조건 밟아야하고, 연속된 3개를 밟을 수 없으므로,
  - 첫번째 계단과 두번째 계단 둘 중 큰 수 하나를 밟고 세번째를 밟는 것이 최대값이다.
 4. 계단이 n개일 때 dp[n] = input[n] + max(dp[n-3] + input[n-1], dp[n-2])
  - n개의 계단이 있을때 n-1계단을 밟았다고 가정하면, 세개 연속 밟을 수 없으므로 n-3도 무조건 밟았을 것이다.
            🏋️‍♀️ n = 5
          🏃‍♂️‍➡️🟨 n = 4 => n-1을 밟았다면
        ❌🟨🟨 n = 3 => 규칙에 의해 n=3은 발이 닿을 수 없음
      🏃‍♂️‍➡️🟨🟨🟨 n = 2 => n-3 은 이미 계산되었음 (이전거 신경 안씀)
      🟨🟨🟨🟨 n = 1
  - n개의 계단이 있을 때 n-2계단을 밟았다고 가정하면, 그 이전에 n-3, n-4 모두 밟을 수 있었지만 이건 이전 사이클에서 이미 계산되어 n-2가 된 것이므로 고려하지 않는다.
            🏋️‍♀️ n = 5
            🟨 n = 4
        🏃‍♂️‍➡️🟨🟨 n = 3 => n-2 은 이미 계산되었음 (이전거 신경 안씀)
        🟨🟨🟨 n = 2
      🟨🟨🟨🟨 n = 1
  - 위 두개의 경우중 큰 수가 dp[n]이 된다.
 
 ----------------
 
 계단 오르기 https://www.acmicpc.net/problem/2579
 
 계단 오르는 데는 다음과 같은 규칙이 있다.

 계단은 한 번에 한 계단씩 또는 두 계단씩 오를 수 있다. 즉, 한 계단을 밟으면서 이어서 다음 계단이나, 다음 다음 계단으로 오를 수 있다.
 연속된 세 개의 계단을 모두 밟아서는 안 된다. 단, 시작점은 계단에 포함되지 않는다.
 마지막 도착 계단은 반드시 밟아야 한다.
 따라서 첫 번째 계단을 밟고 이어 두 번째 계단이나, 세 번째 계단으로 오를 수 있다. 하지만, 첫 번째 계단을 밟고 이어 네 번째 계단으로 올라가거나, 첫 번째, 두 번째, 세 번째 계단을 연속해서 모두 밟을 수는 없다.

 각 계단에 쓰여 있는 점수가 주어질 때 이 게임에서 얻을 수 있는 총 점수의 최댓값을 구하는 프로그램을 작성하시오.
 
 입력
 입력의 첫째 줄에 계단의 개수가 주어진다.

 둘째 줄부터 한 줄에 하나씩 제일 아래에 놓인 계단부터 순서대로 각 계단에 쓰여 있는 점수가 주어진다. 계단의 개수는 300이하의 자연수이고, 계단에 쓰여 있는 점수는 10,000이하의 자연수이다.

 출력
 첫째 줄에 계단 오르기 게임에서 얻을 수 있는 총 점수의 최댓값을 출력한다.

 예제 입력 1
6
10
20
15
25
10
20
 
 예제 출력 1
 75

 [예제] n <= 2인 경우
1
5
 answer: 5
 
2
6
7
 answer: 13
 */
