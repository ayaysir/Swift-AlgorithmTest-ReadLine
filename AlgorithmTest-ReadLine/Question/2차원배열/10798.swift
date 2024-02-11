//
//  10798.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/11/24.
//

import Foundation

func Q_10798() {
    let array = (0..<5).map { _ in
        readLine()!.map(String.init)
    }
    
    let columnCount = array.max { $0.count < $1.count }!.count
    var resultArr: [[String]] = .init(repeating: [], count: columnCount)
    
    for strArr in array {
        for (i, str) in strArr.enumerated() {
            resultArr[i].append(str)
        }
    }
    
    print(resultArr.flatMap{$0}.joined())
}

/*
예제 입력 1
ABCDE
abcde
01234
FGHIJ
fghij

예제 출력 1
Aa0FfBb1GgCc2HhDd3IiEe4Jj

예제 입력 2
AABCDD
afzz
09121
a8EWg6
P5h3kx

예제 출력 2
Aa0aPAf985Bz1EhCz2W3D1gkD6x
 */
