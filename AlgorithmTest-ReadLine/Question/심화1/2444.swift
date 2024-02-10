//
//  2444.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/10/24.
//

import Foundation

func Q_2444() {
    let n = Int(readLine()!)!,
        t = 2 * n - 1,
        m = t / 2
    var s = ""
    let b = "\n"
    
    for i in 0..<t {
        s += .init(repeating: " ", count: i <= m ? m - i : i - m)
        + .init(repeating: "*", count: i <= m ? i * 2 + 1 : (t - i - 1) * 2 + 1)
        + b
    }
    
    print(s)
}

func Q_2444_SHORT() {
    let t=2*Int(readLine()!)!-1,m=t/2
    for i in 0..<t{print(.init(repeating:" ",count:i<=m ?m-i:i-m)
    + .init(repeating:"*",count:i<=m ?i*2+1:2*t-2*i-1))}
}
