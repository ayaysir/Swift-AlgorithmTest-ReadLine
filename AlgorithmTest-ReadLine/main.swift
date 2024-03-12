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
     2745: Q_2745,
     11005: Q_11005,
     2720: Q_2720,
     2903: Q_2903,
     2292: Q_2292,
     1193: Q_1193,
     2869: Q_2869,
     5086: Q_5086,
     2501: Q_2501,
     9506: Q_9506,
     1978: Q_1978,
     2581: Q_2581,
     11653: Q_11653,
     27323: Q_27323,
     1085: Q_1085,
     3009: Q_3009,
     9063: Q_9063,
     10101: Q_10101,
     5073: Q_5073,
     14215: Q_14215,
     24313: Q_24313,
     2231: Q_2231,
     19532: Q_19532,
     1018: Q_1018,
     1436: Q_1436,
     2839: Q_2839,
     2750: Q_2750,
     2587: Q_2587,
     25305: Q_25305,
     2751: Q_2751,
     10989: Q_10989,
     1427: Q_1427,
     11650: Q_11650,
     1181: Q_1181,
     10841: Q_10814,
     18870: Q_18870,
     10815: Q_10815,
     14425: Q_14425,
     7785: Q_7785,
     1620: Q_1620,
     10816: Q_10816,
     1764: Q_1764,
     1269: Q_1269,
     11478: Q_11478,
     1934: Q_1934,
     13241: Q_13241,
     1735: Q_1735,
     2485: Q_2485,
     1929: Q_1929,
     4134: Q_4134,
     4948: Q_4948,
     17103: Q_17103,
     13909: Q_13909,
     28278: Q_28278,
     10773: Q_10773,
     9012: Q_9012,
     4949: Q_4949,
     12789: Q_12789,
     18258: Q_18258,
     2164: Q_2164,
     11866: Q_11866,
     28279: Q_28279,
     2346: Q_2346,
     24511: Q_24511,
     15439: Q_15439,
     24723: Q_24723,
     10872: Q_10872,
     11050: Q_11050,
     1010: Q_1010,
     1037: Q_1037,
     25192: Q_25192,
     26069: Q_26069,
     2108: Q_2108,
     20920: Q_20920,
]

let targetQuestion =
20920

func question(_ number: Int) {
    print("======== Question \(number) ========")
    questionDict[number]!()
}

var once = false
if once {
    question(targetQuestion)
} else {
    while true {
        question(targetQuestion)
    }
}
