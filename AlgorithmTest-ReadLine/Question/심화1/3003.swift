//
//  3003.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/10/24.
//

import Foundation

func Q_3003() {
    print(readLine()!.split{$0==" "}.enumerated().map{[1,1,2,2,2,8][$0]-Int($1)!}.map{"\($0) "}.joined())
}
