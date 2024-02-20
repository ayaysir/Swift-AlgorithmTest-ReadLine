//
//  19532.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/20/24.
//

import Foundation

func Q_19532() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c, d, e, f) = (r[0], r[1], r[2], r[3], r[4], r[5])
    
    for x in -999...999 {
        for y in -999...999 {
            if a*x + b*y == c, d*x + e*y == f {
                print(x, y)
                break
            }
        }
    }
}
