//
//  1085.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/14/24.
//

import Foundation

func Q_1085() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y) = (r[0], r[1])
    let (w, h) = (r[2], r[3])
    
    print(min(x, y, h - y, w - x))
}

func Q_1085_SHORT() {
    let r=readLine()!.split{$0==" "}.map{Int($0)!}
    print(min(r[0],r[1],r[2]-r[0],r[3]-r[1]))
}
