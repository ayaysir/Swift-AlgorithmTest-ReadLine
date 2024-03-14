//
//  15665.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 11: 568ms
func Q_15665_() {
    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var combi: [String] = []
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
        
        for i in 0..<numbers.count{
            combi.append("\(numbers[i])")
            backtracking()
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}

/// N과 M 11: 164ms
func Q_15665() {
    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var combi = Array(repeating: "", count: m)
    var result = ""
    
    // prevCombi는 틀렸습니다 뜸

    func backtracking(_ x: Int = 0) {
        if x == m {
            result.write(combi.joined() + "\n")
            return
        }
        
        var prev = 0
        for i in 0..<numbers.count where prev != numbers[i] {
            combi[x] = "\(numbers[i]) "
            prev = numbers[i]
            backtracking(x + 1)
        }
    }
    
    backtracking()
    print(result)
}
