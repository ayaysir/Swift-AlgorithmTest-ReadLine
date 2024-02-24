//
//  11653.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/13/24.
//

// import Foundation

func Q_11653() {
    func sieveOfEratosthenes(_ n: Int) -> Set<Int> {
        guard n > 2 else {
            return n == 2 ? [2] : []
        }
        
        var primes: Set<Int> = Set((2...n).map { $0 })
        
        for i in 2..<primes.count where primes.contains(i) {
            guard i * i <= n else {
                print(i)
                break
            }
            
            for j in 2..<primes.count where  i * j <= n && primes.contains(i * j) {
                print(primes.contains(i * j))
                primes.remove(i * j)
            }
        }
        
        return primes
    }
    
    func sieveOfEratosthenes2(_ limit: Int) -> [Int] {
        var isPrime = [Bool](repeating: true, count: limit + 1)
        var primes = [Int]()

        var i = 2
        while i * i <= limit {
            if isPrime[i] {
                var j = i * i
                while j <= limit {
                    isPrime[j] = false
                    j += i
                }
            }
            i += 1
        }

        for i in 2...limit {
            if isPrime[i] {
                primes.append(i)
            }
        }

        return primes
    }
    
    // let primes = sieveOfEratosthenes(n)
    var n = Int(readLine()!)!
    
    func 방법1() {
        for prime in stride(from: 2, through: n, by: 1) {
            while n % prime == 0 {
                print(prime)
                n /= prime
            }
        }
    }
    
    func 방법2() {
        var prime = 2
        while n > 1 {
            while n % prime == 0 {
                print(prime)
                n /= prime
            }
            prime += 1
        }
    }
    
    방법1()
    
    /*
     예) 50을 소인수분해
     1. 50 / 2 = 25
     2. 2 => 3(소수)으로 증가: 안나눠짐
     3. 2 => 4(소수아님)으로 증가: 안나눠짐
     4. 25 / 5 = 5
     5. 5 / 5 = 0
     답) 2, 5, 5
     
     예) 71을 소인수분해
     1. 71 / 2 = X
     2. 71 / 3 = X
     3. 71 / 4 = X
     4. 71 / 5 = X
     5. 71 / ...70 = X
     6. 71 / 71 = 0
     답) 71
     
     예) 51을 소인수분해
     1. 51 / 2 = X
     2. 51 / 3 = 17
     3. 17 / 4 = X
     4. 17 / 16 = X
     5. 17 / 17 = 0
     답) 3, 17
     */
}

/*
 소인수분해 https://www.acmicpc.net/problem/11653
 
 문제
 정수 N이 주어졌을 때, 소인수분해하는 프로그램을 작성하시오.

 입력
 첫째 줄에 정수 N (1 ≤ N ≤ 10,000,000)이 주어진다.

 출력
 N의 소인수분해 결과를 한 줄에 하나씩 오름차순으로 출력한다. N이 1인 경우 아무것도 출력하지 않는다.

예제 입력 1
72
예제 출력 1
2
2
2
3
3
 
예제 입력 2
3
예제 출력 2
3
 
예제 입력 3
6
예제 출력 3
2
3
 
예제 입력 4
2
예제 출력 4
2
 
예제 입력 5
9991
예제 출력 5
97
103
 
예)
999999999

3
3
3
3
37
333667
 
 
예)
10000000
 
 2
 2
 2
 2
 2
 2
 2
 5
 5
 5
 5
 5
 5
 5
 */
