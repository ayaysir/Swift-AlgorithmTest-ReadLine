//
//  9252.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/8/2024.
//
//  4: LCS 2 https://www.acmicpc.net/problem/9252
//

import Foundation

/// LCS 2 https://www.acmicpc.net/problem/9252
func Q_9252() {
    let seqA = readLine()!.map(String.init)
    let seqB = readLine()!.map(String.init)
    var dp = Array(repeating: Array(repeating: 0, count: seqB.count + 1), count: seqA.count + 1)
    
    for i in seqA.indices {
        for j in seqB.indices {
            if seqA[i] == seqB[j] {
                dp[i + 1][j + 1] = dp[i][j] + 1
            } else {
                dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j])
            }
        }
    }
    
    print(dp[seqA.count][seqB.count])
    
    // LCS 알아내기
    var (i, j) = (seqA.count, seqB.count)
    var result = [String]()
    
    while dp[i][j] != 0 {
        if dp[i - 1][j] == dp[i][j] {
            (i, j) = (i - 1, j)
        } else if dp[i][j - 1] == dp[i][j] {
            (i, j) = (i, j - 1)
        } else {
            // 두 축이 같은 문자인 경우이므로 둘 중 아무거나 써도 된다.
            result.append(seqB[j - 1])
            (i, j) = (i - 1, j - 1)
        }
    }
    
    print(result.reversed().joined())
    // print(dp.map(String.init).joined(separator: "\n"))
}

/*
 [풀이] https://velog.io/@emplam27/알고리즘-그림으로-알아보는-LCS-알고리즘-Longest-Common-Substring와-Longest-Common-Subsequence
 9251(LCS 1) 문제에 경로 추적이 포함된 형태
 
 (1) DP 테이블 가장 마지막에서 시작해서 역추적
 (2) DP[i-1][j] 또는 DP[i][j-1]이 현재 값 DP[i][j]와 같다면 => 해당 셀로 i, j를 이동
 (3) 다르다면 => 현재 셀의 위치에 해당하는 문자를 result 배열에 넣고 포인터를 대각선 (i-1, j-1)로 이동
 (4) dp[i][j] 가 0인 곳으로 이동하면 while 종료
 (5) result 배열을 뒤집기
 
 +-----+---+---+---+---+---+---+---+
 | i\j ║ - | A | B | C | D | E | F |
 +=====+===+===+===+===+===+===+===+
 |  -  ║ 0 | 0 | 0 | 0 | 0 | 0 | 0 |
 +-----+---+---+---+---+---+---+---+
 |  G  ║ 0 | 0 | 0 | 0 | 0 | 0 | 0 |
 +-----+---+---↖---+---+---+---+---+
 |  B  ║ 0 | 0 | 1 | 1 | 1 | 1 | 1 |
 +-----+---+---+---↖---+---+---+---+
 |  C  ║ 0 | 0 | 1 | 2 | 2 | 2 | 2 |
 +-----+---+---+---+---↖---+---+---+
 |  D  ║ 0 | 0 | 1 | 2 | 3 ← 3 | 3 |
 +-----+---+---+---+---+---+---↖---+
 |  F  ║ 0 | 0 | 1 | 2 | 3 | 3 | 4 |
 +-----+---+---+---+---+---+---+-↑-+
 |  E  ║ 0 | 0 | 1 | 2 | 3 | 4 | 4 |
 +-----+---+---+---+---+---+---+---+
 LCS => "BCDF"
 
 ---------
 
 문제
 LCS(Longest Common Subsequence, 최장 공통 부분 수열)문제는 두 수열이 주어졌을 때, 모두의 부분 수열이 되는 수열 중 가장 긴 것을 찾는 문제이다.

 예를 들어, ACAYKP와 CAPCAK의 LCS는 ACAK가 된다.

 입력
 첫째 줄과 둘째 줄에 두 문자열이 주어진다. 문자열은 알파벳 대문자로만 이루어져 있으며, 최대 1000글자로 이루어져 있다.

 출력
 첫째 줄에 입력으로 주어진 두 문자열의 LCS의 길이를, 둘째 줄에 LCS를 출력한다.

 LCS가 여러 가지인 경우에는 아무거나 출력하고, LCS의 길이가 0인 경우에는 둘째 줄을 출력하지 않는다.

 예제 입력 1
 ACAYKP
 CAPCAK
 
 예제 출력 1
 4
 ACAK
 
 예제 입력 2
 GBCDFE
 ABCDEF
 
 예제 출력 2
 4
 BCDF
 */
