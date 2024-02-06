//
//  10951.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/6/24.
//

import Foundation

func Q_10951() {
    while let s = readLine() {
        let r = s.split(separator: " ").map { Int($0)! }
        print(r[0] + r[1])
    }
}
