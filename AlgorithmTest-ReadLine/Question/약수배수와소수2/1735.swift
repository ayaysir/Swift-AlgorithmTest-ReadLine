//
//  1735.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/24/24.
//

import Foundation

func Q_1735() {
    let a = readLine()!.split(separator: " ").map { Int($0)! }, (numA, denA) = (a[0], a[1])
    let b = readLine()!.split(separator: " ").map { Int($0)! }, (numB, denB) = (b[0], b[1])
    
    let newNum = numA * denB + numB * denA
    let newDen = denA * denB
    
    func findGCD(_ a: Int, _ b: Int) -> Int {
        (a % b == 0) ? b : findGCD(b, a % b)
    }
    
    let gcd = findGCD(newNum, newDen)
    print(newNum / gcd, newDen / gcd)
}
