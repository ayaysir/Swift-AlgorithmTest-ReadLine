//
//  10797.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/7/24.
//

import Foundation

func Q_10797() {
    let n = Int(readLine()!)!
    print(readLine()!.split(separator: " ").map { Int($0)! }.reduce(0) { $0 + ($1 == n ? 1 : 0) })
}
