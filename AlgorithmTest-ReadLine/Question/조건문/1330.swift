//
//  1330.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/4/24.
//

import Foundation

func Q_1330() {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    print(input[0] > input[1] ? ">" : input[0] == input[1] ? "==" : "<") 
}
