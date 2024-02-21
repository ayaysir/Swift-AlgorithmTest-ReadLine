//
//  18870.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/21/24.
//

import Foundation

func Q_18870() {
    _ = readLine()
    let coords = readLine()!.split(separator: " ").map { Int($0)!  }
    
    let orders = Set(coords).sorted(by: <)
    let extracts = (0..<orders.count).map { $0 }
    let dict = Dictionary(uniqueKeysWithValues: zip(orders, extracts))
    
    var result = ""
    for coord in coords {
        result.write("\(dict[coord]!) ")
    }
    
    print(result)
}
