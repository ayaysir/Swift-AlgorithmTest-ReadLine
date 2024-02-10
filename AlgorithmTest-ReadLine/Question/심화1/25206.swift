//
//  25206.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/10/24.
//

import Foundation

func Q_25206() {
    let grades: [String: Double] = [
        "A+": 4.5,
        "A0": 4.0,
        "B+": 3.5,
        "B0": 3.0,
        "C+": 2.5,
        "C0": 2.0,
        "D+": 1.5,
        "D0": 1.0,
        "F": 0.0,
    ]
    
    var creditSum = 0.0
    var scoreSum = 0.0
    
    for _ in 0..<20 {
        let splitted = readLine()!.split(separator: " ")
        let (credit, grade) = (Double(splitted[1])!, String(splitted[2]))
        if grade == "P" { continue }
        creditSum += credit
        scoreSum += credit * grades[grade]!
    }
    
    print(scoreSum / creditSum)
}
