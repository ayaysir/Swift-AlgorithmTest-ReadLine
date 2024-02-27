//
//  2164.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/27/24.
//

import Foundation

func Q_2164() {
    var queue = (1...Int(readLine()!)!).map { String($0) }, qIndex = 0, wIndex = 1
    while qIndex != queue.count - 1 {
        let top = queue[qIndex]
        
        if wIndex % 2 == 0 {
            queue.append(top)
        }
        
        qIndex += 1
        wIndex += 1
    }
    
    print(queue[qIndex])
}

func Q_2164_SHORT() {
    var q=(1...Int(readLine()!)!).map{"\($0)"},i=0,w=1
    while i<q.count-1{if w%2==0{q+=[q[i]]};i+=1;w+=1}
    print(q[i])
}
