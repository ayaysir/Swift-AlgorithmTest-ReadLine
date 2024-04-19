//
//  2742.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/18/24.
//

import Foundation

/// 기찍 N https://www.acmicpc.net/problem/20040
func Q_2742() {
    print(stride(from: Int(readLine()!)!, through: 1, by: -1).map(String.init).joined(separator: "\n"))
}
