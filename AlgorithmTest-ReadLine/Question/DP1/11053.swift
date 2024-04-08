//
//  11053.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/19/24.
//

import Foundation

/// 가장 긴 증가하는 부분 수열 https://www.acmicpc.net/problem/11053
func Q_11053() {
    _ = readLine()
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = Array(repeating: 1, count: 1000)
    
    for i in stride(from: 1, to: numbers.count, by: 1) {
        for j in stride(from: 0, to: i, by: 1) where numbers[j] < numbers[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
    
    print(dp.max()!)
}

/*
 [풀이]
 - numbers[j] (뒤에 위치)가 numbers[i] (앞에 위치)보다 작을 때만 for문이 동작
 - dp[i]: 앞에 위치한 숫자에서의 LIS 길이
 - dp[j]: 뒤에 위치한 숫자에서의 LIS 길이
   - dp[j]는 현재 숫자를 포함하지 않는 부분 수열의 최대 길이이고, 여기에 현재 숫자를 추가하면 길이가 1 증가
   - dp[j] + 1은 현재 숫자를 포함한 부분 수열의 길이를 나타냅니다.
 
 ---------
 
 문제
 수열 A가 주어졌을 때, 가장 긴 증가하는 부분 수열을 구하는 프로그램을 작성하시오.

 예를 들어, 수열 A = {10, 20, 10, 30, 20, 50} 인 경우에 가장 긴 증가하는 부분 수열은 A = {'10', '20', 10, '30', 20, '50'} 이고, 길이는 4이다.

 입력
 첫째 줄에 수열 A의 크기 N (1 ≤ N ≤ 1,000)이 주어진다.

 둘째 줄에는 수열 A를 이루고 있는 Ai가 주어진다. (1 ≤ Ai ≤ 1,000)

 출력
 첫째 줄에 수열 A의 가장 긴 증가하는 부분 수열의 길이를 출력한다.

 예제 입력 1
6
10 20 10 30 20 50
 
 예제 출력 1
 4
 */
