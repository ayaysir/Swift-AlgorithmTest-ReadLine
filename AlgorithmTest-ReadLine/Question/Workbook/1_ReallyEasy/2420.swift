//
//  2420.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/6/24.
//

// import Foundation

/// 사파리월드 https://www.acmicpc.net/problem/2420
func Q_2420() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    print(abs(r[0] - r[1]))
}

/*
 요약: N - M 의 절대값을 구하는 문제 (-2,000,000,000 ≤ N, M ≤ 2,000,000,000)
 
 분류
 - 수학
 - 구현
 - 사칙연산
 */

