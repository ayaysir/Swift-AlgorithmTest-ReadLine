//
//  1181.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/21/24.
//

import Foundation

func Q_1181() {
    let words = (0..<Int(readLine()!)!).map { _ in readLine()! }
    Set(words).sorted(by: { $0.count == $1.count ? $0 < $1 : $0.count < $1.count }).forEach { print($0) }
}
