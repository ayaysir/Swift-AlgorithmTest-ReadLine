//
//  24416.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/17/24.
//

import Foundation

func Q_24416() {
    let n = Int(readLine()!)!
    var dp = [-1, 1, 1] + Array(repeating: -1, count: n)
    for i in 3...n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    
    print(dp[n], n - 2)
}

/*
 알고리즘 수업 - 피보나치 수  1 https://www.acmicpc.net/problem/24416
  - 문제 요약: n의 피보나치 수와 실행 횟수를 출력
 
 --------------
 
 fib(n) {
     if (n = 1 or n = 2)
     then return 1;  # 코드1
     else return (fib(n - 1) + fib(n - 2));
 }
 
 를
 
 fibonacci(n) {
     f[1] <- f[2] <- 1;
     for i <- 3 to n
         f[i] <- f[i - 1] + f[i - 2];  # 코드2
     return f[n];
 }
 로 바꾸는 문제
 */
