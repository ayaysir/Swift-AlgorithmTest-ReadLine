//
//  15656.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 7: 804ms
func Q_15656_() {
    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var combi: [String] = []
    var result = ""

    func backtracking() {
        guard combi.count < m else {
            result.write(combi.joined(separator: " ") + "\n")
            return
        }
        
        for i in 0..<numbers.count {
            combi.append("\(numbers[i])")
            backtracking()
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}

/// N과 M 7: 440ms
func Q_15656() {
    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var result = ""

    func backtracking(_ k: Int = 0, _ seq: String = "") {
        guard k < m else {
            result.write(seq + "\n")
            return
        }
        
        for i in 0..<numbers.count {
            backtracking(k + 1, seq + "\(numbers[i]) ")
        }
    }
    
    backtracking()
    print(result)
}
