//
//  2447.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/13/24.
//

import Foundation

func Q_2447_OLD() {
    let n = Int(readLine()!)!
    
    func recur(_ n: Int) -> [String] {
        if n == 1 {
            return ["*"]
        }
        
        let star = recur(n / 3)
        var stars: [String] = []
        
        for s in star {
            stars.append(String(repeating: s, count: 3))
        }
        
        for s in star {
            stars.append(s + String(repeating: " ", count: n / 3) + s)
        }
        
        for s in star {
            stars.append(String(repeating: s, count: 3))
        }

        return stars
    }
    
    print(recur(n).joined(separator: "\n"))
}

func Q_2447() {
    let n = Int(readLine()!)!
    
    func recur(_ size: Int, pattern: [String]) -> [String] {
        if size == 1 {
            return pattern
        }
        
        let side = pattern.map { $0 + $0 + $0 }
        let space = pattern.map { $0 + String(repeating: " ", count: $0.count) + $0 }
        
        return recur(size / 3, pattern: side + space + side)
    }
    
    print(recur(n, pattern: ["*"]).joined(separator: "\n"))
}


/*
 [풀이] n = 9인 경우
 첫번째 순환에서 side는 ["***"], space는 ["* *"]
  => recur(n / 3, pattern: ["***", "* *", "***"]
 두번째 순환에서 (n = 9 / 3 = 3)
  - side는 ["*********",
           "* ** ** *",
           "*********"]
  - space는 ["***   ***",
            "* *   * *",
            "***   ***"]
  => recur(n / 3, pattern: [side + space + side])
 세번째 순환에서 (n = 3 / 3 = 1) size = 1이므로 return
 
 [풀이] n = 27인 경우
 첫번째 순환에서 side는 ["***"], space는 ["* *"]
  => recur(n / 3, pattern: ["***", "* *", "***"]
 
 두번째 순환에서 (n = 27 / 3 = 9)
  - side는 ["*********"] (=> 3*3=9)
  - space는 ["* ** ** *"]
 (...)
 
 -------------
 별 찍기 - 10 https://www.acmicpc.net/problem/2447
 */
