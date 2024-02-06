//
//  10952.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/6/24.
//

import Foundation

func Q_10952() {
    while let s = readLine() {
        let r = s.split(separator: " ").map { Int($0)! }
        if r[0] == 0, r[1] == 0 { break }
        print(r[0] + r[1])
    }
}
