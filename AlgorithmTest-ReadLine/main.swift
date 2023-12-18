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
    17086: Q_17086,
    11399: Q_11399,
    1541: Q_1541,
    2748: Q_2748,
    9095: Q_9095,
    1912: Q_1912,
    10844: Q_10844,
    15486: Q_15486,
    9465: Q_9465,
    1789: Q_1789,
    2512: Q_2512,
    1654: Q_1654,
    18352: Q_18352,
    1753: Q_1753,
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
// 2606
// 17086
// 11399
// 1541
// 2748
// 9095
// 1912
// 10844
// 15486
// 9465
// 1789
// 2512
// 1654
// 18352
1753

var once = false
if once {
    question(targetQuestion)
} else {
    while true {
        question(targetQuestion)
    }
}
