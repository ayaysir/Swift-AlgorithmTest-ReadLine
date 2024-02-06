//
//  11021.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/6/24.
//

import Foundation

func Q_11021() {
    var s = ""
    (1...Int(readLine()!)!).forEach {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        s += "Case #\($0): \(r[0] + r[1])\n"
    }
    print(s)
}
