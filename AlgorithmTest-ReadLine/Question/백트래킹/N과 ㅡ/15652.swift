//
//  15652.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 4
func Q_15652() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    
    var combi: [String] = []
    var result = ""

    func backtracking() {
        guard combi.count < m else {
            result.write(combi.joined(separator: " ") + "\n")
            return
        }
        
        for i in 1...n {
            let iStr = String(i)
            if let last = combi.last, last > iStr {
                continue
            }
            
            combi.append(iStr)
            backtracking()
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}
