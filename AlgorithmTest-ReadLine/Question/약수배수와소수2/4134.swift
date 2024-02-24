//
//  4134.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/24/24.
//

import Foundation

func Q_4134() {
    func isPrime(_ n: Int) -> Bool {
        guard n > 3 else {
            return 2...3 ~= n
        }
        
        for divisor in 2... {
            if n % divisor == 0 {
                return false
            }
            
            guard divisor * divisor < n else {
                break
            }
        }
        
        return true
    }
    
    for _ in 0..<Int(readLine()!)! {
        for i in Int(readLine()!)!... {
            if isPrime(i) {
                print(i)
                break
            }
        }
    }
}
