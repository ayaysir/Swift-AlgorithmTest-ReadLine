//
//  15649.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 1: 체크 배열 + 값 배열 추가시 스트링으로 변환: 76ms
func Q_15649() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    
    var combi: [String] = []
    var usedArr = Array(repeating: false, count: 10)
    var result = ""

    func backtracking() {
        if combi.count == m {
            result.write(combi.joined(separator: " ") + "\n")
            return
        }
        
        for i in 1...n where !usedArr[i] {
            combi.append("\(i)")
            usedArr[i] = true
            
            backtracking()
            
            usedArr[i] = false
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}


/// N과 M 1: 체크 배열: 96ms
func Q_15649___() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    
    var combi: [Int] = []
    var usedArr = Array(repeating: false, count: n)
    var result = ""

    func backtracking() {
        if combi.count == m {
            result.write(combi.map(String.init).joined(separator: " ") + "\n")
        }
        
        for i in 1...n where !usedArr[i] {
            combi.append(i)
            usedArr[i] = true
            
            backtracking()
            
            usedArr[i] = false
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}

/// N과 M 1: 별도 체크 변수 X: 96ms
func Q_15649__() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    
    var combi: [Int] = []
    var result = ""

    func backtracking() {
        if combi.count == m {
            result.write(combi.map(String.init).joined(separator: " ") + "\n")
            return
        }
        
        for i in 1...n where !combi.contains(i) {
            combi.append(i)
            backtracking()
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}

/// N과 M 1: set 사용: 108ms
func Q_15649_() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    
    var combi: [Int] = []
    var usedSet: Set<Int> = []
    var result = ""

    func backtracking() {
        if combi.count == m {
            result.write(combi.map(String.init).joined(separator: " ") + "\n")
            return
        }
        
        for i in 1...n where !usedSet.contains(i) {
            combi.append(i)
            usedSet.insert(i)
            
            backtracking()
            
            usedSet.remove(i)
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}
