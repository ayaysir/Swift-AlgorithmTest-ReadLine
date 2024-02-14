//
//  10101.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/14/24.
//

import Foundation

func Q_10101() {
    let numbers = (0..<3).map { _ in Int(readLine()!)! }
    
    if numbers.allSatisfy({ $0 == 60 }) {
        print("Equilateral")
    } else if numbers.reduce(0, +) != 180 {
        print("Error")
    } else if Set(numbers).count == 3 {
        print("Scalene")
    } else {
        print("Isosceles")
    }
    
    // Equilateral: 정삼각형, Isosceles: 이등변삼각형, Scalene: 부등변삼각형
}
