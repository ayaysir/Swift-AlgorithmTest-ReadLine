//
//  2751.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/21/24.
//

import Foundation

func Q_2751() {
    print((0..<Int(readLine()!)!)
        .map { _ in Int(readLine()!)! }
        .sorted()
        .forEach { print($0) } // reduce("") { ... } 쓴 것이 오히려 시간초과됨
    )
}
