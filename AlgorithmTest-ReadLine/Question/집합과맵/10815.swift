//
//  10815.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/22/24.
//

import Foundation

func Q_10815() {
    let _ = readLine(), cards = Set(readLine()!.split(separator: " ").map { Int($0)! })
    let _ = readLine(), refs = readLine()!.split(separator: " ").map { Int($0)! }
    
    print(refs.map { cards.contains($0) ? "1" : "0" }.joined(separator: " "))
}

func Q_10815_SHORT() {
    let r={readLine()!.split{$0==" "}.map{Int($0)!}},_=r(),c=Set(r()),_=r()
    print(r().map{c.contains($0) ?"1 ":"0 "}.joined())
}
