//
//  2750.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/21/24.
//

import Foundation

func Q_2750() {
    Set((0..<Int(readLine()!)!).map { _ in
        Int(readLine()!)!
    }).sorted().forEach {
        print($0)
    }
}
