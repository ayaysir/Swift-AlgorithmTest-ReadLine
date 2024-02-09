//
//  10871.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/7/24.
//

import Foundation

func Q_10871() {
    let nx = readLine()!.split(separator: " ").map { Int($0)! }
    let (_, x) = (nx[0], nx[1])
    let a = readLine()!.split(separator: " ").map { Int($0)! }
    print(a.filter{$0 < x}.map(String.init).joined(separator: " "))
}
