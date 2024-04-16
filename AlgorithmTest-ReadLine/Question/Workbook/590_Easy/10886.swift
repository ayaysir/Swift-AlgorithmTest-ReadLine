//
//  10886.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/14/24.
//

import Foundation

/// 0 = not cute / 1 = cute https://www.acmicpc.net/problem/10886
func Q_10886() {
    let n = Int(readLine()!)!
    var cuteCount = 0
    for _ in 0..<n {
        cuteCount += Int(readLine()!)! == 1 ? 1 : 0
    }
    
    let isCute = cuteCount > n - cuteCount
    print("Junhee is", isCute ? "cute!" : "not cute!")
}
