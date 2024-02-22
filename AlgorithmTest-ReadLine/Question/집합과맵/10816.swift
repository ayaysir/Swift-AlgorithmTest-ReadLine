//
//  10816.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/22/24.
//

import Foundation

func Q_10816() {
    let _ = readLine()
    let cards = readLine()!.split(separator: " ").map { Int($0)! }
    var dict: [Int: Int] = [:]
    for card in cards {
        dict[card, default: 0] += 1
    }
    
    _ = readLine()
    let refs = readLine()!.split(separator: " ").map { Int($0)! }
    
    print(refs.map { "\(dict[$0] ?? 0) " }.joined())
}

func Q_10816_SHORT() {
    var r={readLine()!.split{$0==" "}.map{Int($0)!}},_=r(),c=r(),d=[Int:Int](),_=r(),f=r()
    for o in c{d[o,default:0]+=1}
    print(f.map{"\(d[$0] ?? 0) "}.joined())
}
