//
//  2753.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/4/24.
//

import Foundation

func Q_2753() {
    let input = Int(readLine()!)!

    if input % 4 == 0, (input % 100 != 0 || input % 400 == 0) {
        print("1")
    } else {
        print("0")
    }
}
