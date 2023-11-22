//
//  1789.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/11/22.
//

import Foundation

func Q_1789() {
    let N = Int(readLine()!)!
    
    guard N > 1 else {
        print(N)
        return
    }
    
    let root = Int(round(sqrt(Double(N))))

    for i in root...(4294967295) {
        let sum = (i * (i + 1)) / 2
        
        if sum == N {
            print(i)
            break
        } else if sum > N {
            print(i - 1)
            break
        }
    }
}
