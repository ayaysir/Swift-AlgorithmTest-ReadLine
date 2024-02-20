//
//  2884.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/4/24.
//

import Foundation

func Q_2884() {
    let r = readLine()!.split(separator:" ").map{Int($0)!}
    let h = r[0] == 0 && r[1] < 45 ? 24 : r[0]
    let t = h * 60 + r[1] - 45
    print(t / 60, t % 60)
}
