//
//  15655.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 6: 24ms
func Q_15655_() {
    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var combi: [String] = []
    var usedArr = Array(repeating: false, count: numbers.count)
    var result = ""

    func backtracking() {
        if combi.count == m {
            result.write(combi.joined(separator: " ") + "\n")
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

/// N과 M 6: 8ms
func Q_15655() {
    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var combi: [String] = []
    var usedArr = Array(repeating: false, count: numbers.count)
    var result = ""

    func backtracking(_ start: Int = 0) {
        if combi.count == m {
            result.write(combi.joined(separator: " ") + "\n")
            return
        }
        
        for i in start..<numbers.count where !usedArr[i] {
            combi.append("\(numbers[i])")
            usedArr[i] = true
            backtracking(i + 1)
            usedArr[i] = false
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}
