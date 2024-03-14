//
//  15651.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 3: 420ms
func Q_15651() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    
    var combi: [String] = []
    var result = ""

    func backtracking() {
        guard combi.count < m else {
            result.write(combi.joined(separator: " ") + "\n")
            return // 스택오버플로 안되게 종료
        }
        
        for i in 1...n {
            combi.append(String(i))
            backtracking()
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}

/// N과 M 3: 216ms
func Q_15651_() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    
    var result = ""

    func backtracking(_ x: Int, _ nStr: String = "") {
        if x == m {
            result.write("\(nStr)\n")
            return
        }
        
        for i in 1...n {
            backtracking(x + 1, nStr + "\(i) ")
        }
    }
    
    backtracking(0)
    print(result)
}
