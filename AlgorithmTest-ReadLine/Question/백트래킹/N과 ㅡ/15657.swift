//
//  15657.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 8
func Q_15657() {
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
            if let last = combi.last, let lastInt = Int(last), lastInt > numbers[i] {
                continue
            }
            
            combi.append("\(numbers[i])")
            backtracking()
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}
