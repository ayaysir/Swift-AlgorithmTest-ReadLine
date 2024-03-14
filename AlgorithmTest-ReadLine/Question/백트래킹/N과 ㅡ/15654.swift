//
//  15654.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 5: 112ms
func Q_15654() {
    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var combi: [Int] = []
    var result = ""

    func backtracking() {
        if combi.count == m {
            result.write(combi.map(String.init).joined(separator: " ") + "\n")
            return
        }
        
        for number in numbers where !combi.contains(number) {
            combi.append(number)
            backtracking()
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}

/// N과 M 5: 80ms
func Q_15654_() {
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
