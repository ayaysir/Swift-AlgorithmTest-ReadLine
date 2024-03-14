//
//  15666.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 12: 12ms
func Q_15666() {
    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var combi = Array(repeating: "", count: m)
    var result = ""
    
    // prevCombi는 틀렸습니다 뜸

    func backtracking(_ x: Int = 0) {
        if x == m {
            result.write(combi.joined(separator: " ") + "\n")
            return
        }
        
        var prev = 0
        for i in 0..<numbers.count where prev != numbers[i] {
            if x > 0, Int(combi[x - 1])! > numbers[i] {
                continue
            }
            
            combi[x] = "\(numbers[i])"
            prev = numbers[i]
            backtracking(x + 1)
        }
    }
    
    backtracking()
    print(result)
}

/// N과 M 12: 64ms
func Q_15666_() {
    // import Foundation

    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

    var combi = Array(repeating: "", count: numbers.count)
    var result = ""
    func backtracking(_ x: Int = 0) {
        if x == m {
            result.write(combi.joined() + "\n")
            return
        }

        var prev = 0
        for i in 0..<numbers.count where prev != numbers[i] {
            if x > 0, Int(combi[x - 1].trimmingCharacters(in: .whitespaces))! > numbers[i] {
                continue
            }

            combi[x] = "\(numbers[i]) "
            prev = numbers[i]
            backtracking(x + 1)
        }
    }

    backtracking()
    print(result)
}
