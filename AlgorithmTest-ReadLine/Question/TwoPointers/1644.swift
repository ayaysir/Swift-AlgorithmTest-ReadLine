//
//  1644.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/5/2024.
//
//  4: 소수의 연속합 https://www.acmicpc.net/problem/1644
//

import Foundation

/// 소수의 연속합 https://www.acmicpc.net/problem/1644
func Q_1644() {
    let n = Int(readLine()!)!

    // 에라토스테네스의 채 128ms
    // var primes: [Int] = []
    // var sieve = Array(repeating: true, count: n + 1)
    // 
    // for i in stride(from: 2, through: n, by: 1) {
    //     if sieve[i] {
    //         primes.append(i)
    //         
    //         for j in stride(from: 2 * i, through: n, by: i) {
    //             sieve[j] = false
    //         }
    //     }
    // }
    
    // 76ms
    var candidates = [Bool](repeating: true, count: n + 1)
    (0...1).forEach { candidates[$0] = false }
    
    var p = 2
    while p * p <= n {
        if candidates[p] {
            var squared = p * p
            
            while squared <= n {
                candidates[squared] = false
                squared += p
            }
        }
        
        p += 1
    }
    
    let primes = candidates.enumerated().compactMap { $1 ? $0 : nil }
    
    // 1. 자신이 소수인가?
    if n == 1 {
        print(0)
    } else if primes.count == 1 {
        print(1)
    } else {
        var result = primes.last! == n ? 1 : 0
        
        // 2. 소수 배열 구간합? 구하기
        var (l, r) = (0, 1)
        var partialSum = primes[l] + primes[r]
        
        while true {
            if partialSum == n {
                result += 1
            }
            
            if partialSum < n {
                r += 1
                partialSum += primes[r]
            } else {
                l += 1
                if l + 1 >= primes.count {
                    break
                } else {
                    // r = l + 1
                    // partialSum = primes[l] + primes[r]
                    partialSum -= primes[l - 1]
                }
            }
        }
        
        print(result)
    }
}

/*
 [풀이]
 - 에라토스테네스의 채를 이용해 소수 목록 구함 (오름차순 정렬)
 - 소수를 투포인터로 움직여가면서 (1)연속되면서 (2)정답과 일치하는지 확인
   => 연속되는지 여부를 만족하려면 포인터간 구간합으로 계산
   => 왼쪽 포인터는 가만히 있는 상태에서 오른쪽 포인터를 오른쪽으로 움직이면서 확인
   => 같은 값이 나왔거나 목표값을 초과했다면 (어느 방법을 사용해도 처리 속도 동일)
     (1) r은 그대로 놔두고 l을 왼쪽으로 이동 후 구간합 업데이트
     (2) l을 왼쪽으로 이동 후 l 바로 옆에 r을 두고 다시 시작
   
 -------
 
 문제
 하나 이상의 연속된 소수의 합으로 나타낼 수 있는 자연수들이 있다. 몇 가지 자연수의 예를 들어 보면 다음과 같다.

 3 : 3 (한 가지)
 41 : 2+3+5+7+11+13 = 11+13+17 = 41 (세 가지)
 53 : 5+7+11+13+17 = 53 (두 가지)
 하지만 연속된 소수의 합으로 나타낼 수 없는 자연수들도 있는데, 20이 그 예이다. 7+13을 계산하면 20이 되기는 하나 7과 13이 연속이 아니기에 적합한 표현이 아니다. 또한 한 소수는 반드시 한 번만 덧셈에 사용될 수 있기 때문에, 3+5+5+7과 같은 표현도 적합하지 않다.

 자연수가 주어졌을 때, 이 자연수를 연속된 소수의 합으로 나타낼 수 있는 경우의 수를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 자연수 N이 주어진다. (1 ≤ N ≤ 4,000,000)

 출력
 첫째 줄에 자연수 N을 연속된 소수의 합으로 나타낼 수 있는 경우의 수를 출력한다.

 예제 입력 1
 20
 예제 출력 1
 0
 
 예제 입력 2
 3
 예제 출력 2
 1
 
 예제 입력 3
 41
 예제 출력 3
 3
 
 예제 입력 4
 53
 예제 출력 4
 2
 */
