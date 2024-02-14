//
//  3009.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/14/24.
//

import Foundation

func Q_3009() {
    var xs: [Int] = [], ys: [Int] = []
    
    for _ in 0..<3 {
        let r = readLine()!.split(separator: " ").map{ Int($0)! }
        xs.append(r[0])
        ys.append(r[1])
    }
    
    let x = xs[0] == xs[1] ? xs[2] : xs[0] == xs[2] ? xs[1] : xs[0]
    let y = ys[0] == ys[1] ? ys[2] : ys[0] == ys[2] ? ys[1] : ys[0]
    
    print(x, y)
}
