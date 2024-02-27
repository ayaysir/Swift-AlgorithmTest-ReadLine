//
//  28278.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/25/24.
//

import Foundation

func Q_28278() {
    var stack: [Int] = []
    
    for _ in 0..<Int(readLine()!)! {
        guard let r = readLine() else {
            print(-1)
            continue
        }
        
        switch r {
        case "2":
            let popped = stack.popLast()
            print(popped ?? -1)
        case "3":
            print(stack.count)
        case "4":
            print(stack.isEmpty ? 1 : 0)
        case "5":
            print(stack.last ?? -1)
        default:
            stack.append(r.split(separator: " ").map { Int($0)! }[1])
        }
    }
}

func Q_28278_SHORT() {
// var s=[Int]()
// (0..<Int(readLine()!)!).map{$0;let r=readLine()!.split{$0==" "}.map{Int($0)!},c=r[0]
// if c==1{s+=[r[1]]}else{print(c==2 ?s.popLast() ?? -1:c==3 ?s.count:c==4 ?(s.isEmpty ?1:0):s.last ?? -1)}}
}
