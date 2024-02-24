//
//  17103.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/24/24.
//

import Foundation

func Q_17103_시간초과() {
    let sieve: [Bool] = {
        var sieve = Array(repeating: true, count: 1000000 * 2 + 1)
        (sieve[0], sieve[1]) = (false, false)
        let rootN = Int(sqrt(Double(sieve.count)))
        
        for i in 2...rootN where sieve[i] {
            for j in stride(from: i * i, to: sieve.count, by: i) {
                sieve[j] = false
            }
        }
        
        return sieve
    }()
    
    for _ in 0..<Int(readLine()!)! {
        let number = Int(readLine()!)!
        let primes = Set(sieve[0..<number].enumerated().compactMap { i, v in v ? i : nil })
        
        var pairs: Set<[Int]> = []
        for prime in primes {
            if primes.contains(number - prime) {
                pairs.insert([prime, number - prime].sorted())
            }
        }
        
        print(pairs.count)
    }
}

func Q_17103() {
    var primes: [Int] = []
    var sieve = Array(repeating: true, count: 1000001)
    sieve.append(contentsOf: [true, true])
    
    for i in 2...1000000 {
        if sieve[i] {
            primes.append(i)
            
            for j in stride(from: 2 * i, through: 1000000, by: i) {
                sieve[j] = false
            }
        }
    }
    
    for _ in 0..<Int(readLine()!)! {
        let number = Int(readLine()!)!
        
        var pairsCount = 0
        
        for prime in primes
        where prime <= number && sieve[number - prime] && prime <= number - prime {
            pairsCount += 1
        }
        
        print(pairsCount)
    }
}

/*
 [해설]
 - https://greentea31.tistory.com/24
 - (입력 수 - 찾은 소수) = 소수 이면 파티션이다.
 - for 문의 where절 조건 (if문을 where로 빼내도 동작하며 시간 차이 없음)
    (1) number 내의 소수들 중 (prime <= number)
    (2) number - prime이 소수이며 (sieve[number - prime])
    (3) 중복 쌍이 있는 경우 그 중 하나 (prime <= number - prime이면 한 쌍만 true일수밖에 없음)
 - 에라토스테네스의 채를 미리 만들어놓고 소수가 numbers 내에서만 for문을 돌게 한다.
   - 채(sieve)를 밖으로 꺼내놓고 소수 목록(primes)과 별도로 관리하는 방법이 있다. (n이 커도 시간 안걸림)
 - 중복 (예: 12-5=7, 12-7=5)를 방지하기 위해 prime <= number - prime 를 추가한다.
    - prime: 5인 경우 5 <= 7(=>12 - 5)로 true 이며
    - prime: 7인 경우 7 <= 5(=>12 - 7)로 false가 되므로
    - 결과적으로 두 쌍중 하나만 걸러낼 수 있다.

 ======================
 
 골드바흐 파티션 https://www.acmicpc.net/problem/17103
 
 문제
 골드바흐의 추측: 2보다 큰 짝수는 두 소수의 합으로 나타낼 수 있다.
 짝수 N을 두 소수의 합으로 나타내는 표현을 골드바흐 파티션이라고 한다. 짝수 N이 주어졌을 때, 골드바흐 파티션의 개수를 구해보자. 두 소수의 순서만 다른 것은 같은 파티션이다.

 입력
 첫째 줄에 테스트 케이스의 개수 T (1 ≤ T ≤ 100)가 주어진다. 각 테스트 케이스는 한 줄로 이루어져 있고, 정수 N은 짝수이고, 2 < N ≤ 1,000,000을 만족한다.

 출력
 각각의 테스트 케이스마다 골드바흐 파티션의 수를 출력한다.

 예제 입력 1
 5
 6
 8
 10
 12
 100
 
 예제 출력 1
 1
 1
 2
 1
 6
 */
