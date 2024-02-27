//
//  9012.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/26/24.
//

import Foundation

func Q_9012() {
    for _ in 0..<Int(readLine()!)! {
        var stack1 = readLine()!.map(String.init)
        var stack2 = [String]()
        
        while !stack1.isEmpty {
            let popped = stack1.popLast()!
            if !stack2.isEmpty, popped == "(" && stack2.last! == ")" {
                _ = stack2.popLast()
            } else {
                stack2 += [popped]
            }
        }
        
        print(stack2.count == 0 ? "YES" : "NO")
    }
}
