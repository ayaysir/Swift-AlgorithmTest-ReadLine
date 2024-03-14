//
//  15650.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/14/24.
//

import Foundation

/// N과 M 2
func Q_15650() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    
    var combi: [String] = []
    var usedArr = Array(repeating: false, count: n)
    var result = ""

    func backtracking() {
        if combi.count == m {
            result.write(combi.joined(separator: " ") + "\n")
            return
        }
        
        for i in 1...n where !usedArr[i] {
            let iStr = String(i)
            
            // combi에 마지막 원소가 있고, 마지막 원소가 현재 i보다 크면 오름차순이 아니므로 continue
            if let last = combi.last, last > iStr {
                continue
            }
            
            combi.append(iStr)
            usedArr[i] = true
            backtracking()
            usedArr[i] = false
            combi.removeLast()
        }
    }
    
    backtracking()
    print(result)
}

/// N과 M 2
func Q_15650_() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    
    var combi: [String] = [], used = Array(repeating: false, count: m)
    var result = ""

    func onlySeekAscending(_ start: Int) {
        if combi.count == m {
            result.write(combi.joined(separator: " ") + "\n")
            return
        }
        
        for i in start...n where !used[i] {
            combi.append(String(i))
            used[i] = true
            
            onlySeekAscending(i)
            
            used[i] = false
            combi.removeLast()
        }
    }
    
    onlySeekAscending(1)
    print(result)
}
