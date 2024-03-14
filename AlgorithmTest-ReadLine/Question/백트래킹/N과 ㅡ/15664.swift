//
//  15664.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 10
func Q_15664() {
    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var combi: [String] = []
    var usedArr = Array(repeating: false, count: numbers.count)
    var result = ""
    var alreadyWritten: Set<String> = []

    func backtracking() {
        if combi.count == m {
            let sequence = combi.joined(separator: " ")
            if !alreadyWritten.contains(sequence) {
                result.write(sequence + "\n")
                alreadyWritten.insert(sequence)
            }
            
            return
        }
        
        for i in 0..<numbers.count where !usedArr[i] {
            if let last = combi.last, let lastInt = Int(last), lastInt > numbers[i] {
                continue
            }
            
            combi.append("\(numbers[i])")
            usedArr[i] = true
            backtracking()
            usedArr[i] = false
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}
