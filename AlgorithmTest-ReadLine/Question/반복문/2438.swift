//
//  2438.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/6/24.
//

import Foundation

func Q_2438() {
    print((1...Int(readLine()!)!).reduce(""){$0+String(repeating:"*",count:$1)+"\n"})
}
