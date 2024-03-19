//
//  9251.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/19/24.
//

import Foundation

func Q_9251() {
    let seqA = readLine()!.map(String.init)
    let seqB = readLine()!.map(String.init)
    var dp = Array(repeating: Array(repeating: 0, count: seqB.count + 1), count: seqA.count + 1)
    
    for i in seqA.indices {
        for j in seqB.indices {
            if seqA[i] == seqB[j] {
                dp[i+1][j+1] = dp[i][j] + 1
            } else {
                dp[i+1][j+1] = max(dp[i][j+1], dp[i+1][j])
            }
        }
    }
    
    print(dp)
}

/*
 [풀이] https://velog.io/@emplam27/알고리즘-그림으로-알아보는-LCS-알고리즘-Longest-Common-Substring와-Longest-Common-Subsequence
 1. 아래와 같은 2차원 DP 테이블을 그린다. (기본값 0)
  - 각 축에 시퀀스의 문자를 하나씩 배치한다.
 2. 두 문자가 같다면, 바로 대각선 좌상 ↖ 방향의 값에 1을 더해준다.
 3. 두 문자가 다르다면, 바로 왼쪽의 ← 방향의 값과 바로 위의 ↑ 방향의 값 중 큰 값을 가져온다.
 4. 최종 결과는 dp[aSize][bSize]
 
 +---+---+---+---+---+---+---+---+
 | \ ║ - | C | A | P | C | A | K |
 +===+===+===+===+===+===+===+===+
 | - ║ 0 | 0 | 0 | 0 | 0 | 0 | 0 |
 +---+---+---↘---+---+---+---+---+
 | A ║ 0 | 0 | 1 | 1 | 1 | 1 | 1 |
 +---+---+---+---+---+---+---+---+
 | C ║ 0 | 1 | 1 | 1 | 2 | 2 | 2 |
 +---+---+---+---+-↓-+---+---+---+
 | A ║ 0 | 1 | 2 → 2 | 2 | 3 | 3 |
 +---+---+---+---+---+---+---+---+
 | Y ║ 0 | 1 | 2 | 2 | 2 | 3 | 3 |
 +---+---+---+---+---+---+---+---+
 | P ║ 0 | 1 | 2 | 2 | 2 | 3 | 4 |
 +---+---+---+---+---+---+---+---+
 | K ║ 0 | 1 | 2 | 3 | 3 | 3 | 4 |
 +---+---+---+---+---+---+---+---+
 
 --------------
 
 LCS https://www.acmicpc.net/problem/9251
 
 문제
 LCS(Longest Common Subsequence, 최장 공통 부분 수열)문제는 두 수열이 주어졌을 때, 모두의 부분 수열이 되는 수열 중 가장 긴 것을 찾는 문제이다.

 예를 들어, ACAYKP와 CAPCAK의 LCS는 ACAK가 된다.

 입력
 첫째 줄과 둘째 줄에 두 문자열이 주어진다. 문자열은 알파벳 대문자로만 이루어져 있으며, 최대 1000글자로 이루어져 있다.

 출력
 첫째 줄에 입력으로 주어진 두 문자열의 LCS의 길이를 출력한다.

 예제 입력 1
 ACAYKP
 CAPCAK
 
 예제 출력 1
 4
 */
