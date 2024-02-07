//
//  10807.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/7/24.
//

import Foundation

func Q_10807() {
    let n = Int(readLine()!)!
    let a = readLine()!.split(separator: " ").map { Int($0)! }
    let v = Int(readLine()!)!
    print(a.reduce(0) { $0 + ($1 == v ? 1 : 0)})
}
