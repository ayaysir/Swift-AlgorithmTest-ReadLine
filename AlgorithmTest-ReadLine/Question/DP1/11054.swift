//
//  11054.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/19/24.
//

import Foundation

func Q_11054() {
    _ = readLine()
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = Array(repeating: 1, count: 1000)
    var dpDsc = Array(repeating: 1, count: 1000)
    
    for i in stride(from: 1, to: numbers.count, by: 1) {
        for j in stride(from: 0, to: i, by: 1) where numbers[i] > numbers[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
    
    // 감소 수열 구하기
    // i는 끝-1에서 0까지 왼쪽으로 이동하며, j 끝에서 i까지 왼쪽으로 이동
    // 횡단 시작끝점을 바꾸면 where 조건을 바꾸지 않아도 됨
    for i in stride(from: numbers.count - 2, through: 0, by: -1) {
        for j in stride(from: numbers.count - 1, to: i, by: -1) where numbers[i] > numbers[j]  {
            dpDsc[i] = max(dpDsc[i], dpDsc[j] + 1)
        }
    }
    
    print(zip(dp, dpDsc).map { $0 + $1 - 1 }.max()!)
}

/*
[풀이] https://seohyun0120.tistory.com/entry/백준-11054-가장-긴-바이토닉-부분-수열-풀이
 - 증가 수열의 경우의 수와 감소 수열의 경우의 수를 더한 값 중 가장 큰 값 - 1 이 정답
 
--------------
 
가장 긴 바이토닉 부분 수열 https://www.acmicpc.net/problem/11054
 
문제
수열 S가 어떤 수 Sk를 기준으로 S1 < S2 < ... Sk-1 < Sk > Sk+1 > ... SN-1 > SN을 만족한다면, 그 수열을 바이토닉 수열이라고 한다.

예를 들어, {10, 20, 30, 25, 20}과 {10, 20, 30, 40}, {50, 40, 25, 10} 은 바이토닉 수열이지만,  {1, 2, 3, 2, 1, 2, 3, 2, 1}과 {10, 20, 30, 40, 20, 30} 은 바이토닉 수열이 아니다.

수열 A가 주어졌을 때, 그 수열의 부분 수열 중 바이토닉 수열이면서 가장 긴 수열의 길이를 구하는 프로그램을 작성하시오.

입력
첫째 줄에 수열 A의 크기 N이 주어지고, 둘째 줄에는 수열 A를 이루고 있는 Ai가 주어진다. (1 ≤ N ≤ 1,000, 1 ≤ Ai ≤ 1,000)

출력
첫째 줄에 수열 A의 부분 수열 중에서 가장 긴 바이토닉 수열의 길이를 출력한다.
 
예제 입력 1
10
1 5 2 1 4 3 4 5 2 1

예제 출력 1
7
 
 https://www.acmicpc.net/board/view/56223
TC #9 (1-4-3-2-1)
7
1 4 3 2 1 5 6
ans: 5
output: 4

TC #10 (1-2-4-3-2-1)
7
1 2 4 3 2 4 1
ans: 6
output: 4

TC #11 (1-5-4-2)
5
1 5 4 2 3
ans: 4
output: 3

TC #15 (9-8-6-5-4-1)
10
9 8 6 2 3 5 4 10 1 7
ans: 6
output: 5

TC #16 (1-5-4-3 / 1-5-4-2)
5
1 5 4 2 3
ans: 4
output: 3

TC #18 (1-2-3-2-1)
7
9 1 2 3 2 1 9
ans: 5
output: 4

TC #19 (1-3-5-7-6-3-2-1)
10
10 1 3 5 7 6 3 2 1 10
ans: 8
output: 5
 
TC #1 (예제와 다른 반례입니다) (1-2-3-4-5-2-1)
10
1 6 2 1 4 3 4 5 2 1
ans: 7

TC #2 (1-2-3-4-5-4)
17
7 2 1 1 5 2 2 3 2 3 1 2 4 5 1 2 4
ans: 6

TC #3 (1)
1
1
ans: 1

TC #4 (1-2-3-2-1)
6
1 2 3 3 2 1
ans: 5

TC #5 (1-2-1)
5
1 2 1 1 1
ans: 3

TC #6 (999-1000)
2
999 1000
ans: 2

TC #7 (1-3-2-1)
5
1 3 1 2 1
ans: 4

TC #8 (1-2)
10
1 2 2 2 2 2 2 2 2 2
ans: 2

TC #12 (1-4-5-6)
6
3 2 1 4 5 6
ans: 4

TC #13 (1-2-6-2-1)
7
5 1 6 2 6 2 1
ans: 5

TC #14 (1-2-3-7-2-1)
9
5 1 6 2 7 3 7 2 1
ans: 6

TC #17 (5-6-7-3-2-1 / 1-2-3-7-2-1)
9
5 1 6 2 7 3 7 2 1
ans: 6

*/
