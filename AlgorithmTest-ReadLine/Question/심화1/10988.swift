//
//  10988.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/10/24.
//

import Foundation

/// 회문확인
func Q_10988() {
    let w = readLine()!.map(String.init)
    let c = w.count
    var (l, r) = (0, c - 1)
    
    for _ in 0..<c {
        if l >= r {
            print(1)
            break
        }
        
        if w[l] == w[r] {
            l += 1
            r -= 1
            continue
        } else {
            print(0)
            break
        }
    }
}
