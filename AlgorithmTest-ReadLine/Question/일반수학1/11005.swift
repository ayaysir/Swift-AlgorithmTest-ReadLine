//
//  11005.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/12/24.
//

// import Foundation

func Q_11005() {
    let input = readLine()!.split(separator: " ")
    let base = Int(input[1])!
    var number = Int(input[0])!
    var remainders: [Int] = []
    
    while number > 0 {
        remainders.append(number % base)
        number /= base
    }
    
    print(remainders.map {
        if $0 < 10 {
            return "\($0)"
        }
        
        return String(UnicodeScalar(55 + $0)!)
    }.reversed().joined())
}

/*
예제 입력 1
60466175 36

예제 출력 1
ZZZZZ
 
462683 15
출력: 92158
 
36000 36
출력: RS0
*/
