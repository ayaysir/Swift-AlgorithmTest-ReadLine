//
//  2587.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/21/24.
//

import Foundation

func Q_2587() {
    let values = (0..<5).map { _ in Int(readLine()!)! }.sorted()
    print(values.reduce(0, +) / values.count, values[2], separator: "\n")
}
