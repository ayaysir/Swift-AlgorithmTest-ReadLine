//
//  14002.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/8/2024.
//
//  2: 가장 긴 증가하는 부분 수열 4 https://www.acmicpc.net/problem/14002
//

import Foundation

/// 가장 긴 증가하는 부분 수열 4 https://www.acmicpc.net/problem/14002
func Q_14002() {
    let MAX = 1000, _ = readLine()
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = Array(repeating: 1, count: MAX)
    
    for i in stride(from: 1, to: numbers.count, by: 1) {
        for j in stride(from: 0, to: i, by: 1) where numbers[j] < numbers[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
    
    let maxEnu = dp.enumerated().max { $0.element < $1.element }!
    
    var maxSequence = dp[maxEnu.offset] + 1, paths = [Int]()
    for i in stride(from: maxEnu.offset, through: 0, by: -1) where dp[i] == maxSequence - 1 {
        paths.append(numbers[i])
        maxSequence -= 1
    }
    
    print(maxEnu.element)
    print(paths.reversed().map(String.init).joined(separator: " "))
}

/*
 [풀이]
 - 11053(가장 긴 증가하는 부분 수열) 문제에 경로 표시가 추가됨
 - 중간(maxEnu) 전까지는 기존 풀이(=>최대 길이 구하기)와 동일
 - maxEnu: 최대값 + 인덱스(offset)을 가져옴
 - DP 배열의 예: n = 7, a = [4 5 6 7 1 2 3] => dp = [1, 2, 3, 4, 1, 2, 3,]
   (1) 최대값의 인덱스를 구한다. 최대값의 오른쪽에 있는 값들은 고려하지 않는다.
   (2) 최대값 + 1을 maxSequence로 놓고, 인덱스부터 왼쪽으로 순회하면서
      maxSequence가 딱 1 줄어들었을 때에만 경로를 추가한다.
     - DP 배열에서 최대값과 최소값의 증감 간격은 1임이 보장되어 있다.
   (3) 탐색을 완료했으면 역순으로 표시한다.
 
 --------------
 
 문제
 수열 A가 주어졌을 때, 가장 긴 증가하는 부분 수열을 구하는 프로그램을 작성하시오.

 예를 들어, 수열 A = {10, 20, 10, 30, 20, 50} 인 경우에 가장 긴 증가하는 부분 수열은 A = {10, 20, 10, 30, 20, 50} 이고, 길이는 4이다.

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
 
 [반례]
 
13
3 4 5 6 2 3 1 7 4 3 5 6 7
 ans: 6
 2 3 4 5 6 7
 
7
4 5 6 7 1 2 3
 ans: 4
 4 5 6 7
 */
