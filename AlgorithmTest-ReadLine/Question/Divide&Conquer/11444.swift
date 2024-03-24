//
//  11444.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/23/2024.
//
//  8: 피보나치 수 6 https://www.acmicpc.net/problem/11444
//

import Foundation

/// 피보나치 수 6 https://www.acmicpc.net/problem/11444
func Q_11444() {
    let n = Int(readLine()!)!
    let a = [[1, 1], [1, 0]]
    let P = 1_000_000_007
    
    switch n {
    case 0...17:
        print([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597][n])
    default:
        var result = recursive(a, n)
        
        for i in 0..<2 {
            for j in 0..<2 {
                result[i][j] %= P
            }
        }
        
        print(result[1][0])
    }
    
    /// 주어진 배열 `a`와 `a2`를 행렬곱셈
    func multi(_ a: [[Int]], _ a2: [[Int]]) -> [[Int]] {
        var result = Array(repeating: Array(repeating: 0, count: a.count), count: a.count)
        for i in 0..<a.count {
            for j in 0..<a.count {
                for l in 0..<a[0].count {
                   result[i][j] += a[i][l] * a2[l][j] % P
                }
            }
        }
        
        return result
    }
    
    /// 분할정복: O(N)을 O(logN)으로 줄이기 위함
    func recursive(_ a: [[Int]], _ b: Int) -> [[Int]] {
        if b == 1 {
            return a
        }
        
        let next = recursive(a, b / 2)
        return b % 2 == 0 ? multi(next, next) : multi(multi(next, next), a)
    }
}

/*
 [풀이] https://zzonglove.tistory.com/32
 행렬 {{1,1},{1,0}} 의 멱수를 이용하는 것입니다. 다시 말해서 행렬 멱법을 사용하는 것입니다. Fn 이 n번째 피보나치 숫자라고 한다면,
 
 +---+--- n          +--------+--------+
 | 1 | 1 |           | F(n+1) | F(n)   |
 +---+---+     =     +--------+--------+
 | 1 | 0 |           | F(n)   | F(n-1) |
 +---+---+           +--------+--------+
                 
 - 왼쪽 행렬을 n번 행렬제곱 (=> 10830번 문제)
 
 ----------
 
 문제
 피보나치 수는 0과 1로 시작한다. 0번째 피보나치 수는 0이고, 1번째 피보나치 수는 1이다. 그 다음 2번째 부터는 바로 앞 두 피보나치 수의 합이 된다.

 이를 식으로 써보면 Fn = Fn-1 + Fn-2 (n ≥ 2)가 된다.

 n=17일때 까지 피보나치 수를 써보면 다음과 같다.

 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597

 n이 주어졌을 때, n번째 피보나치 수를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 n이 주어진다. n은 1,000,000,000,000,000,000보다 작거나 같은 자연수이다.

 출력
 첫째 줄에 n번째 피보나치 수를 1,000,000,007으로 나눈 나머지를 출력한다.

 예제 입력 1
 1000
 
 예제 출력 1
 517691607
 
 */
