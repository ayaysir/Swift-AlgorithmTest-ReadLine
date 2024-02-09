//
//  5622.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/9/24.
//

import Foundation

func Q_5622() {
    let keys = (65...90).map {
        Character(UnicodeScalar($0)!)
    }
    
    let distances = [3,3,3,3,3,4,3,4].enumerated().map {
        Array(repeating: $0 + 3, count: $1)
    }.flatMap {
        $0
    }
    
    let dict = Dictionary(uniqueKeysWithValues: zip(keys, distances))
    
    print(readLine()!.reduce(0){$0 + dict[$1]!})
}
