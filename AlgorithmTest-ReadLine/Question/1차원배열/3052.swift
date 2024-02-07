//
//  3052.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/7/24.
//

import Foundation

func Q_3052() {
    var distincts = Set<Int>()
    for _ in 0..<10 {
        distincts.insert(Int(readLine()!)! % 42)
    }
    print(distincts.count)
}
