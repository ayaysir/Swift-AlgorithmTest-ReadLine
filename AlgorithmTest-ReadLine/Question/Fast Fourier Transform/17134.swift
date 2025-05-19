//
//  17134.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 5/19/25.
//
//  4: 르모앙의 추측 https://www.acmicpc.net/problem/17134
//

import Foundation

func Q_17134() {
  let limit = 1_000_000
  
  var sieve = Array(repeating: true, count: limit + 1)
  var primes: [Int] = []
  sieve[0] = false
  sieve[1] = false
  for i in 2...limit where sieve[i] {
    primes.append(i)
    
    for j in stride(from: i + i, through: limit, by: i) {
      sieve[j] = false
    }
  }
  
  var isOddPrime = Array(repeating: Complex(0, 0), count: limit + 1)
  var isEvenSemiPrime = Array(repeating: Complex(0, 0), count: limit + 1)
  
  for n in primes {
    // 홀수 소수
    isOddPrime[n] = (n % 2 != 0) ? Complex(1, 0) : Complex(0, 0)
    
    // 짝수 세미 소수
    if 2*n <= limit {
      isEvenSemiPrime[2*n] = Complex(1, 0)
    }
  }
  
  isEvenSemiPrime[4] = Complex(1, 0) // 2 × 2도 포함, 0 ~ 3은 짝수세미소수 없음
  
  let conv = convolutionII(isOddPrime, isEvenSemiPrime)
  
  var result = ""
  for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    result.append("\(Int(round(conv[n].re)))\n")
  }
  
  print(result)
}

// Q_17134()
