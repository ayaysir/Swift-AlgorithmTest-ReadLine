//
//  9184.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/17/24.
//

import Foundation

func Q_9184_() {
    let capacity = 21
    /// 21*21*21 크기의 3차원 배열 생성
    var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: capacity), count: capacity), count: capacity)
    
    func w(_ a: Int , _ b: Int, _ c: Int) -> Int {
        if a <= 0 || b <= 0 || c <= 0 {
            return 1
        }
        
        if a > 20 || b > 20 || c > 20 {
            return w(20, 20, 20)
        }
        
        if dp[a][b][c] != 0 {
            return dp[a][b][c]
        }
        
        if a < b, b < c {
            dp[a][b][c] = w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)
            return dp[a][b][c]
        }
        
        dp[a][b][c] = w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
        return dp[a][b][c]
    }
    
    while let r = readLine(), r != "-1 -1 -1" {
        let numbers = r.split(separator: " ").map { Int($0)! }
        print("w(\(numbers.map(String.init).joined(separator: ", "))) =", w(numbers[0], numbers[1], numbers[2]))
    }
}

func Q_9184() {
    let capacity = 21
    /// 21*21*21 크기의 3차원 배열 생성
    var dp = Array(repeating: Array(repeating: Array(repeating: 1, count: capacity), count: capacity), count: capacity)
    
    let range = 1...20
    for a in range {
        for b in range {
            for c in range {
                if a < b, b < c {
                    // w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c) 을 dp식으로 변환
                    dp[a][b][c] = dp[a][b][c-1] + dp[a][b-1][c-1] - dp[a][b-1][c]
                } else {
                    // w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1) 을 dp식으로 변환
                    dp[a][b][c] = dp[a-1][b][c] + dp[a-1][b-1][c] + dp[a-1][b][c-1] - dp[a-1][b-1][c-1]
                }
            }
        }
    }
    
    while let r = readLine(), r != "-1 -1 -1" {
        let numbers = r.split(separator: " ").map { Int($0)! }
        let (a, b, c) = (numbers[0], numbers[1], numbers[2])
        let description = "w(\(numbers.map(String.init).joined(separator: ", "))) ="
        let answer: Int = {
            if a <= 0 || b <= 0 || c <= 0 {
                return 1
            } 
            
            if a > 20 || b > 20 || c > 20 {
                return dp[20][20][20]
            }
            
            return dp[a][b][c]
        }()
        
        print(description, answer)
    }
}

/*
[풀이] 두 번째 기준
- 재귀함수가 w(a, b, c)이므로 세개의 파라미터를 가지고 있음 => 3차원 배열 생성
- 피보나치 수열의 재귀 => DP 변환과정 참조
- 터미널 조건을 구현
- 재귀 함수식을 dp 식으로 변환
- 파라미터 3개(=>3차원 dp배열)이므로 3중 for문 사용
- w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c) 에서
- w을 dp로 바꾸고
- 개별 파라미터를 dp[a][b][c-1] + dp[a][b-1][c-1] + dp[a][b-1][c] 같은 형태로 변환

---------------------

신나는 함수 실행 https://www.acmicpc.net/problem/9184

[문제]
다음과 같은 재귀함수 w(a, b, c)가 있다.

if a <= 0 or b <= 0 or c <= 0, then w(a, b, c) returns:
    1

if a > 20 or b > 20 or c > 20, then w(a, b, c) returns:
    w(20, 20, 20)

if a < b and b < c, then w(a, b, c) returns:
    w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)

otherwise it returns:
    w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
 
위의 함수를 구현하는 것은 매우 쉽다. 하지만, 그대로 구현하면 값을 구하는데 매우 오랜 시간이 걸린다. (예를 들면, a=15, b=15, c=15)

a, b, c가 주어졌을 때, w(a, b, c)를 출력하는 프로그램을 작성하시오.

입력
입력은 세 정수 a, b, c로 이루어져 있으며, 한 줄에 하나씩 주어진다. 입력의 마지막은 -1 -1 -1로 나타내며, 세 정수가 모두 -1인 경우는 입력의 마지막을 제외하면 없다.

출력
입력으로 주어진 각각의 a, b, c에 대해서, w(a, b, c)를 출력한다.

제한
-50 ≤ a, b, c ≤ 50

예제 입력 1
1 1 1
2 2 2
10 4 6
50 50 50
-1 7 18
-1 -1 -1

예제 출력 1
w(1, 1, 1) = 2
w(2, 2, 2) = 4
w(10, 4, 6) = 523
w(50, 50, 50) = 1048576
w(-1, 7, 18) = 1
*/
