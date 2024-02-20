//
//  14681.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/4/24.
//

import Foundation

func Q_14681() {
    let (x,y) = (Int(readLine()!)!,Int(readLine()!)!)
    print(x > 0 ? y > 0 ? 1 : 4 : y > 0 ? 2 : 3)
}
