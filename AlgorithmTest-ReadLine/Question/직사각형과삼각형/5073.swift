//
//  5073.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/14/24.
//

import Foundation

func Q_5073() {
    while let r = readLine() {
        let values = r.split(separator: " ").map { Int($0)! }.sorted()
        let (a, b, c) = (values[0], values[1], values[2])
        
        if a == 0, b == 0, c == 0 {
            break
        }
        
        if a == b, b == c {
            print("Equilateral")
        } else if a + b <= c {
            print("Invalid")
        } else if a == b || b == c {
            print("Isosceles")
        } else {
            print("Scalene")
        }
    }
}
