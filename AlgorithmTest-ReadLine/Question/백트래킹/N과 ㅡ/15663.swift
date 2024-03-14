//
//  15663.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 9: 72ms
func Q_15663_() {
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

/// N과 M 9: 32ms
func Q_15663() {
    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var combi: [String] = Array(repeating: "", count: m)
    var usedArr = Array(repeating: false, count: numbers.count)
    var result = ""
    var prevCombi: [String] = []

    func backtracking(_ x: Int = 0) {
        if prevCombi == combi {
            return
        }
        
        if x == m {
            prevCombi = combi
            result.write(combi.joined() + "\n")
            return
        }
        
        for i in 0..<numbers.count where !usedArr[i] {
            combi[x] = "\(numbers[i]) "
            usedArr[i] = true
            backtracking(x + 1)
            usedArr[i] = false
        }
    }
    
    backtracking()
    print(result)
}
