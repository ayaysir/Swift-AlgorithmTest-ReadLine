//
//  main.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/08/17.
//

import Foundation

let questionDict: [Int: (() -> Void)] = [
    2798: Q_2798,
    18108: Q_18018,
    1260: Q_1260,
    1012: Q_1012,
    1697: Q_1697,
    18942: Q_18942,
    2606: Q_2606,
]

func question(_ number: Int) {
    print("======== Question \(number) ========")
    questionDict[number]!()
}

let targetQuestion =
// 2798
// 1260
// 1012
// 1697
2606


while true {
    question(targetQuestion)
}
