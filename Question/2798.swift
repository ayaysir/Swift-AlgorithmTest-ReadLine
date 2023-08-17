//
//  2798.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/08/17.
//

import Foundation

func Q_2798() {
    let NM: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = NM[0]
    let M = NM[1]

    let cards: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var result = 0
    for i in 0..<N {
        for j in (i + 1)..<N {
            for k in (j + 1)..<N {
                let sum = cards[i] + cards[j] + cards[k]
                if sum <= M {
                    result = max(result, sum)
                }
            }
        }
    }
    
    print(result)
}
