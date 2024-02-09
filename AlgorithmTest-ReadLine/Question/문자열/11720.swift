//
//  11720.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/9/24.
//

import Foundation

func Q_11720() {
    _=readLine()
    print(readLine()!.map{Int(String($0))!}.reduce(0,+))
}
