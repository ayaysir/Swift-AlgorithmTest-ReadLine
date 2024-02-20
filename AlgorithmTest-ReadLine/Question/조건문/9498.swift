//
//  9498.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/4/24.
//

import Foundation

func Q_9498() {
    let input = Int(readLine()!)!

    switch input {
        case 90...100:
            print("A")
        case 80...89:
            print("B")
        case 70...79:
            print("C")
        case 60...69:
            print("D")
        default:
            print("F")
    }
}
