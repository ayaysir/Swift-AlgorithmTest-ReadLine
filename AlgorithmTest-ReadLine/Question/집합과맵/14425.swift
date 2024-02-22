//
//  14425.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/22/24.
//

import Foundation

func Q_14425() {
    let p = readLine()!.split(separator: " ").map { Int($0)! }, (n, m) = (p[0], p[1])
    let s = Set((0..<n).map { _ in readLine()! })
    print((0..<m).reduce(0) { a, _ in a + (s.contains(readLine()!) ? 1 : 0) })
}

func Q_14425_SHORT() {
    let p=readLine()!.split{$0==" "}.map{Int($0)!},n=p[0],m=p[1],s=Set((0..<n).map{_ in readLine()!})
    print((0..<m).reduce(0){a,_ in a+(s.contains(readLine()!) ?1:0)})
}
