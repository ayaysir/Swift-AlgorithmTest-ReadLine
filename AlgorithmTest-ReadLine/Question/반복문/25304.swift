//
//  25304.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/6/24.
//

import Foundation

func Q_25304() {
    let x = Int(readLine()!)!
    var sum = 0
    for _ in 0..<Int(readLine()!)! {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        sum += r[0] * r[1]
    }

    print(sum == x ? "Yes" : "No")
}
