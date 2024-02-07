//
//  2562.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/7/24.
//

import Foundation

func Q_2562() {
    var maxV = Int.min, index = 0
    for i in 1...9 {
        let n = Int(readLine()!)!
        if n > maxV {
            index = i
            maxV = n
        }
    }
    print(maxV)
    print(index)
}
