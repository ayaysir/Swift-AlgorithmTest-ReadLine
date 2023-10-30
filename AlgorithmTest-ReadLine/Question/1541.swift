//
//  1541.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/10/26.
//

import Foundation

func Q_1541() {
    let inputs = readLine()!
    let splitted = inputs.split { ["+", "-",].contains(String($0)) }
    
    print(splitted)
}
