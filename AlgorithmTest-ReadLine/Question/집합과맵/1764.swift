//
//  1764.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/22/24.
//

import Foundation

func Q_1764() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }, (n, m) = (r[0], r[1])
    var unknown1 = Set<String>(), bothUnknown = Set<String>(), result = ""
    
    for _ in 0..<n {
        unknown1.insert(readLine()!)
    }
    
    for _ in 0..<m {
        if let member = readLine(), unknown1.contains(member) {
            bothUnknown.insert(member)
        }
    }
    
    result.write("\(bothUnknown.count)\n")
    bothUnknown.sorted().forEach {
        result.write($0 + "\n")
    }
    
    print(result)
}
