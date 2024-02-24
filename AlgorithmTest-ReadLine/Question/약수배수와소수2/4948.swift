//
//  4948.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/24/24.
//

import Foundation

// 시간: 1000ms
func Q_4948_OLD() {
    func isPrime(_ n: Int) -> Bool {
        guard n > 3 else { return 2...3 ~= n }
        
        for divisor in 2... {
            if n % divisor == 0 { return false }
            guard divisor * divisor < n else { break }
        }
        
        return true
    }
    
    var dataset: [Int] = []
    while let r = readLine(), r != "0" {
        dataset.append(Int(r)!)
    }
    
    dataset.forEach {
        var count = 0
        for i in ($0+1)...($0*2) where isPrime(i) {
            count += 1
        }
        
        print(count)
    }
}

// 시간: 24ms
func Q_4948() {
    let sieve: [Bool] = {
        var sieve = Array(repeating: true, count: 123456 * 2 + 1)
        (sieve[0], sieve[1]) = (false, false)
        let rootN = Int(sqrt(Double(sieve.count)))
        
        for i in 2...rootN where sieve[i] {
            for j in stride(from: i * i, to: sieve.count, by: i) {
                sieve[j] = false
            }
        }
        
        return sieve
    }()
    
    var dataset: [Int] = []
    while let r = readLine(), r != "0" {
        dataset.append(Int(r)!)
    }
    
    dataset.forEach {
        print(sieve[$0+1...$0*2].filter { $0 }.count)
    }
}
