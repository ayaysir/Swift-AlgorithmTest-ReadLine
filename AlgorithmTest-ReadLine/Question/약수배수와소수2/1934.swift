//
//  1934.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/23/24.
//

import Foundation

func Q_1934() {
    for _ in 0..<Int(readLine()!)! {
        let r = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
        let (small, large) = (r[0], r[1])
        
        for i in 1...small {
            if large * i % small == 0 {
                print(large * i)
                break
            }
        }
    }
}
