//
//  10870.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/13/24.
//

import Foundation

func Q_10870() {
    func fibonacci(_ n: Int) -> Int {
        0...2 ~= n ? [0, 1, 1][n] : fibonacci(n - 1) + fibonacci(n - 2)
    }
    
    print(fibonacci(Int(readLine()!)!))
}

func Q_10870_repetive() {
    let n = Int(readLine()!)!
    
    var fn1 = 1, fn2 = 1
    
    if n == 0 {
        print(0)
    } else if 1...2 ~= n {
        print(1)
    } else {
        for i in 3...n {
            let newResult = fn1 + fn2
            fn2 = fn1
            fn1 = newResult
            
            if i == n {
                print(newResult)
            }
        }
    }
}

func Q_10870_DP() {
    let n = Int(readLine()!)!
    var dp = [0, 1, 1, 2]
    
    if n > 3 {
        for i in 4...n {
            dp.append(dp[i-1] + dp[i-2])
        }
    }
    
    print(dp[n])
}

/*
 피보나치 수 5 https://www.acmicpc.net/problem/10870
  - 문제 요약: n번째 피보나치수를 구하라
 */
