//
//  2675.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/9/24.
//

import Foundation

func Q_2675() {
    for _ in 0..<Int(readLine()!)! {
        var r = readLine()!.split { $0 == " " },
        (n, text) = (Int(r[0])!, r[1]),
        output = ""
        
        for c in text {
            output += .init(repeating: c, count: n)
        }
        
        print(output)
    }
}
