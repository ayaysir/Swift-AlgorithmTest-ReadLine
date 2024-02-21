//
//  1427.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/21/24.
//

import Foundation

func Q_1427() {
    var array = [Int](repeating: 0, count: 10)
    
    for value in readLine()!.map({Int(String($0))!}) {
        array[value] += 1
    }
    
    print((0...9).reversed().reduce("") { $0 + String(repeating: "\($1)", count: array[$1]) })
}
