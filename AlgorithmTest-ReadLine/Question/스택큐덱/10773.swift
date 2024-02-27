//
//  10773.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/25/24.
//

import Foundation

func Q_10773() {
    var stack: [Int] = []
    for _ in 0..<Int(readLine()!)! {
        if let n = Int(readLine()!), n != 0 {
            stack += [n]
        } else {
            _ = stack.popLast()!
        }
    }
    
    print(stack.reduce(0, +))
}

func Q_10773_SHORT() {
    // var s=[Int](),n=0,r={Int(readLine()!)!}
    // (0..<r()).map{$0;n=r();if n==0{s.popLast()}else{s+=[n]}}
    // print(s.reduce(0,+))
}
