//
//  2798.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/08/17.
//

import Foundation

/*
 입력 1:
 5 21
 5 6 7 8 9
 
 출력 1:
 21
 
 입력 2:
 10 500
 93 181 245 214 315 36 185 138 216 295
 
 출력 2:
 497
 */

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
