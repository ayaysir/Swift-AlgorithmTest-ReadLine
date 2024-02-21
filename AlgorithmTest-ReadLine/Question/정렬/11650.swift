//
//  11650.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/21/24.
//

import Foundation

func Q_11650_OLD() {
    let coords = (0..<Int(readLine()!)!).map { _ in
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        return [r[0], r[1]]
    }
    
    coords.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }.forEach { print($0[0], $0[1]) }
}

func Q_11650() {
    var coords: [[Int]] = []
    for _ in 0..<Int(readLine()!)! {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        coords.append([r[0], r[1]])
    }
    
    coords.sort { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
    coords.forEach { print($0[0], $0[1]) }
}
