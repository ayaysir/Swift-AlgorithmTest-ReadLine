//
//  9461.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/17/24.
//

import Foundation

func Q_9461() {
    let cases = (0..<Int(readLine()!)!).map { _ in Int(readLine()!)! }
    var dp = [.min, 1, 1, 1, 2, 2, 3, 4, 5, 7, 9, 12] + Array(repeating: 0, count: cases.max()! - 11)
    
    for i in 12..<dp.count {
        dp[i] = dp[i-1] + dp[i-5]
    }
    
    for n in cases {
        print(dp[n])
    }
}

/*
 파도반 수열 https://www.acmicpc.net/problem/9461
 - 내가 생각한 점화식: dp[N] = dp[N - 1] + dp[N - 5] (맞음)
 - 일반적인 점화식: dp[N] = dp[N - 2] + dp[N - 3]
 */
