//
//  main.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/08/17.
//

import Foundation

let ready: () -> Void = { exit(0) }
let questionDict: [Int: (() -> Void)] = [
    -1: ready,
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
     1277: Q_1277,
     17609: Q_17609,
     11501: Q_11501,
     2525: Q_2525,
     1330: Q_1330,
     9498: Q_9498,
     2753: Q_2753,
     14681: Q_14681,
     2884: Q_2884,
     2480: Q_2480,
     2739: Q_2739,
     10950: Q_10950,
     8393: Q_8393,
     25304: Q_25304,
     25314: Q_25314,
     15552: Q_15552,
     11021: Q_11021,
     11022: Q_11022,
     2438: Q_2438,
     2439: Q_2439,
     10952: Q_10952,
     10951: Q_10951,
     10807: Q_10807,
     10871: Q_10871,
     10818: Q_10818,
     2562: Q_2562,
     10810: Q_10810,
     10813: Q_10813,
     5597: Q_5597,
     3052: Q_3052,
     10811: Q_10811,
     1546: Q_1546,
     2675: Q_2675,
     5622: Q_5622,
     2908: Q_2908,
     25803: Q_25803,
     3003: Q_3003,
     2444: Q_2444,
     10988: Q_10988,
     1157: Q_1157,
     2941: Q_2941,
     1316: Q_1316,
     25206: Q_25206,
     2738: Q_2738,
     2566: Q_2566,
     10798: Q_10798,
     2563: Q_2563,
]

func question(_ number: Int) {
    print("======== Question \(number) ========")
    questionDict[number]!()
}

let targetQuestion =
2563

var once = false
if once {
    question(targetQuestion)
} else {
    while true {
        question(targetQuestion)
    }
}
