//
//  2292.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/12/24.
//

import Foundation

func Q_2292_OLD_1() {
    var cache: [Int] = []
    cache.append(1)
    
    // [1, 7, 19, 37, 61 ... 999789841, 999899377, 1000008919]
    for i in 1..<18258 {
        let value = cache[i - 1] + 6 * i
        cache.append(value)
    }
    
    let n = Int(readLine()!)!
    
    for (index, edge) in cache.enumerated() {
        if n > edge {
            continue
        } else {
            print(index + 1)
            break
        }
    }
    
    // O(n) = 18258 * 2 (아마...)
}

func Q_2292() {
    let n = Int(readLine()!)!
    var accValue = 1
    
    for i in 1..<18259 {
        if n <= accValue {
            print(i)
            break
        }
        
        accValue += 6 * i
    }
}

func Q_2292_SHORT() {
    var n=Int(readLine()!)!,r=1,i=1
    while n>r{r=r+6*i;i=i+1}
    print(i)
}

/*
 벌집 https://www.acmicpc.net/problem/2292
 
 규칙
 2: 2 ~ 7 (=> 1 + (6*1))
 3: 8 ~ 19 (=> 1 + (6*1) + (6*2))
 4: 20 ~ 37
 5: 38 ~ 61
 6: 62 ~ 91 (=> 1 + (6*1) + (6*2) + ... + (6*5))
 */
