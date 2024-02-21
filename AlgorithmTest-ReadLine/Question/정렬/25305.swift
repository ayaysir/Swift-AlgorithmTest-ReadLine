//
//  25305.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/21/24.
//

import Foundation

func Q_25305() {
    let nk = readLine()!.split(separator: " ").map { Int($0)! }, (_, k) = (nk[0], nk[1])
    let scores = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
    
    print(scores[k - 1])
}
