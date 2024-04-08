//
//  12852.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/8/2024.
//
//  1: 1로 만들기 2 https://www.acmicpc.net/problem/12852
//

import Foundation

/// 1로 만들기 2 https://www.acmicpc.net/problem/12852
func Q_12852() {
    let n = Int(readLine()!)!
    let maxN = 1000000
    var dp = Array(repeating: -1, count: maxN + 1)
    /// 경로를 저장
    var before = Array(repeating: 0, count: maxN + 1)
    
    dp[1] = 0
    before[1] = -1
    
    for i in stride(from: 2, through: n, by: 1) {
        // dp[i]의 크기가 내림차순일것 같은 순서로 조건 확인하면서
        // before[i] 갱신
        
        dp[i] = 1 + dp[i - 1]
        before[i] = i - 1
        
        if i % 2 == 0, 1 + dp[i / 2] < dp[i] {
            dp[i] = 1 + dp[i / 2]
            before[i] = i / 2
        }
        
        if i % 3 == 0, 1 + dp[i / 3] < dp[i] {
            dp[i] = 1 + dp[i / 3]
            before[i] = i / 3
        }
    }
    
    var result = ""
    result += "\(dp[n])\n"
    
    var i = n
    while i != -1 {
        result += "\(i) "
        i = before[i]
    }
    
    print(result)
}

/*
 [풀이] https://cherishvert.tistory.com/37
  - 1463(1로 만들기) 문제에 경로 표시가 추가됨
  - 경로를 추적하는 before 배열을 만들고 dp가 갱신될 때마다 같이 갱신
  - dp[i]의 크기가 내림차순일것 같은 순서로 조건을 확인하면서 갱신하면 최소값을 선택하는 것과 동일한 효과
  - before 배열은 표시할 경로가 인덱스 번호이며, 안의 원소값은 이동해야 할 인덱스 번호임
    예) 예제 10을 입력한 경우, n = 10,
         before[10] = 9 이므로 10 표시하고 9번 인덱스로 이동,
         before[9] = 3, 9 표시
         before[3] = 1, 3 표시
         before[1] = -1 (종료) 1 표시 => 10 9 3 1
 
 ----------
 
 문제
 정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.

 X가 3으로 나누어 떨어지면, 3으로 나눈다.
 X가 2로 나누어 떨어지면, 2로 나눈다.
 1을 뺀다.
 정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.

 입력
 첫째 줄에 1보다 크거나 같고, 106보다 작거나 같은 자연수 N이 주어진다.

 출력
 첫째 줄에 연산을 하는 횟수의 최솟값을 출력한다.

 둘째 줄에는 N을 1로 만드는 방법에 포함되어 있는 수를 공백으로 구분해서 순서대로 출력한다. 정답이 여러 가지인 경우에는 아무거나 출력한다.

 예제 입력 1
 2
 예제 출력 1
 1
 2 1
 
 예제 입력 2
 10
 예제 출력 2
 3
 10 9 3 1
 */
