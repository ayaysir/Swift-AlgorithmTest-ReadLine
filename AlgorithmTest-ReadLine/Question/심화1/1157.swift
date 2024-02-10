//
//  1157.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/10/24.
//

import Foundation

func Q_1157() {
    var freq = [Character: Int]()
    readLine()!.uppercased().forEach {
        freq[$0, default: 0] += 1
    }

    let maxValue = freq.reduce(0) { max($0, $1.value) }
    let maxChrs = freq.filter { $0.value == maxValue }

    print(maxChrs.count > 1 ? "?" : maxChrs.first!.key)
}

func Q_1157_SHORT() {
    var f=[Character: Int](),_=readLine()!.uppercased().map{f[$0,default:0]+=1},x=f.reduce(0){max($0,$1.value)},w=f.filter{$0.value==x}
    print(w.count>1 ?"?":w.first!.key)
}
