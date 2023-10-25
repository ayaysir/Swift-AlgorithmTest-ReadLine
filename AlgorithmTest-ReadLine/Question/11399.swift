//
//  11399.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/10/26.
//

import Foundation

/*
 ATM
 https://www.acmicpc.net/problem/11399
 */

func Q_11399() {
    let input1 = Int(readLine()!)!
    let input2: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var result = input2.sorted().reduce(0) { totalElapsedTime, personalElapsedTime in
        0 + personalElapsedTime
    }
    print(result)
}
