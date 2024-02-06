//
//  2439.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/6/24.
//

import Foundation

func Q_2439() {
    let n = Int(readLine()!)!
    print((1...n).reduce(""){$0+String(repeating:" ",count:n-$1)+String(repeating:"*",count:$1)+"\n"})
}
