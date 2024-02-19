//
//  2231.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/20/24.
//

import Foundation

func Q_2231_OLD() {
    let n = Int(readLine()!)!
    
    var minConstructor = Int.max
    for i in stride(from: n, through: 1, by: -1) {
        let sumOfDigits = String(i).map { Int(String($0))! }.reduce(0, +)
        if i + sumOfDigits == n {
            minConstructor = min(minConstructor, i)
        }
    }
    
    print(minConstructor == .max ? 0 : minConstructor)
}

func Q_2231() {
    func findGenerator(_ n: Int) -> Int {
        /*
         (n - 9 * String(n).count)..<n
         - 생성자에서 자릿수에서 최대로 더할 수 있는 값은 자리수 개수 * 9만큼 (... * String(n).count)
         - n에서 이것 뺀 값 미만은 어차피 답이 될 수 없으므로 시작범위를 n - 9 * String(n).count로 정함
         */
        for i in (n - 9 * String(n).count)..<n {
            var (digitsum, value) = (i, i)
            
            while value > 0 {
                digitsum += value % 10
                value /= 10
            }
            
            if digitsum == n {
                return i
            }
        }
        
        return 0
    }
    
    print(findGenerator(Int(readLine()!)!))
}
