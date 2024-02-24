//
//  1929.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/24/24.
//

import Foundation

func Q_1929() {
    func sieveofEratosthenes(_ n: Int) -> [Int] {
        guard n > 3 else {
            switch n {
            case 2: return [2]
            case 3: return [2, 3]
            default: return []
            }
        }
        
        var sieve = Array(repeating: true, count: n + 1)
        let rootN = Int(sqrt(Double(n)))
        
        for i in 2...rootN {
            if sieve[i] {
                for j in stride(from: 2 * i, through: n, by: i) {
                    sieve[j] = false
                }
            }
        }
        
        return sieve.enumerated().compactMap { number, isPrime in
            number < 2 ? nil : isPrime ? number : nil
        }
    }
    
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (m, n) = (r[0], r[1])
    
    let primes = sieveofEratosthenes(n)
    primes.filter { m...n ~= $0 }.forEach { print($0) }
}

func Q_1929_ANOTHER() {
    func isPrime(_ number: Int) -> Bool {
        guard number > 3 else {
            return 2...3 ~= number
        }
        
        for divisor in 2... {
            if number % divisor == 0 {
                return false
            }
            
            guard divisor * divisor < number else { break }
        }
        
        return true
    }
    
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    print((r[0]...r[1]).filter(isPrime(_:)).map(String.init).joined(separator: "\n"))
}
