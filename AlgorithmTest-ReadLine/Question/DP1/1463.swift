//
//  1463.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/18/24.
//

import Foundation

/// 1로 만들기 https://www.acmicpc.net/problem/1463 - DP
func Q_1463() {
    let n = Int(readLine()!)!
    let maxN = 1000000
    var dp = Array(repeating: -1, count: maxN + 1)
    [-1, 0, 1, 1, 2].enumerated().forEach { (index, value) in dp[index] = value }
    
    for i in stride(from: 5, through: n, by: 1) {
        // i가 3이나 2로 나뉘어지면 그 값'들'과 dp[i-1]의 최소값
        // 아니면(=>둘 다 안나눠지면) dp[i-1]
        let valueDiv3 = i % 3 == 0 ? dp[i/3] : maxN+1
        let valueDiv2 = i % 2 == 0 ? dp[i/2] : maxN+1
        let valueMinus1 = dp[i-1]
        
        dp[i] = 1 + min(valueDiv2, valueDiv3, valueMinus1)
        
        // dp[i] = 1 + dp[i-1]
        // 
        // if i % 3 == 0 {
        //     dp[i] = min(1 + dp[i/3], dp[i])
        // }
        // 
        // if i % 2 == 0 {
        //     dp[i] = min(1 + dp[i/2], dp[i])
        // }
    }
    
    print(dp[n])
}

func Q_1463_RECURSIVE() {
    var result = Int.max
    
    func recursive(_ n: Int, _ count: Int = 0) {
        if n == 1 {
            result = min(result, count)
            return
        }
        
        if n % 3 == 0 {
            recursive(n / 3, count + 1)
        }
        
        if n % 2 == 0 {
            recursive(n / 2, count + 1)
        }
        
        recursive(n - 1, count + 1)
    }
    
    recursive(Int(readLine()!)!)
    print(result)
}

/*
 [풀이] https://beginnerdeveloper-lit.tistory.com/81
 n = 1 ~ 10까지 손계산해본 뒤 점화식 도출
  - n = 1 : 0 (<= 연산을 하지 않아도 1이므로 0번이 맞음)
  - n = 2, 3 : 1
  - n = 4 ~ 10 : [2, 3, 2, 3, 3, 2, 3]
  - N을 1로 만들기 위해 필요한 최소 횟수 = min(
                    n-1의 연산횟수,
                    <2로 나눠진다면> 그 몫의 연산횟수,
                    <3으로 나눠진다면> 그 몫의 연산횟수)
  - 예) 6의 경우
    - 6 / 3 / 2 => 2번
    - 6 / 3 - 1 => 2번
    - 6 / 2 / 3 => 2번
    - 6 / 2 / 3 / 3 => 3번
    - 6 / 3 / 2 / 2 => 3번
    - ((6 - 1 => 5) - 1) / 2 / 2 => 4번
 ---------
 
 1로 만들기 https://www.acmicpc.net/problem/1463
 
 문제
 정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.

 X가 3으로 나누어 떨어지면, 3으로 나눈다.
 X가 2로 나누어 떨어지면, 2로 나눈다.
 1을 뺀다.
 정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.

 입력
 첫째 줄에 1보다 크거나 같고, 10^6 = (1,000,000)보다 작거나 같은 정수 N이 주어진다.

 출력
 첫째 줄에 연산을 하는 횟수의 최솟값을 출력한다.
 */
