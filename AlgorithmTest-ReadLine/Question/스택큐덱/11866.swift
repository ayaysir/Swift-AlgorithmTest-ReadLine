//
//  11866.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/27/24.
//

import Foundation

func Q_11866() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (r[0], r[1])
    var queue = (1...n).map { String($0) }, qIndex = 0, wIndex = 1
    var result = [String]()
    
    while qIndex < queue.count {
        let top = queue[qIndex]
        
        if wIndex % k == 0 {
            result.append(top)
        } else {
            queue.append(top)
        }
        
        qIndex += 1
        wIndex += 1
    }
    
    print("<\(result.joined(separator: ", "))>")
}
