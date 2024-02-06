//
//  10950.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/6/24.
//

import Foundation

func Q_10950() {
    for _ in 0..<Int(readLine()!)! {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        print(r[0] + r[1])
    }
}
