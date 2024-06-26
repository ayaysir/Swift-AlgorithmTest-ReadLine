//
//  1978.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/13/24.
//

import Foundation

/// 소수 찾기 https://www.acmicpc.net/problem/1978
func Q_1978() {
    _ = readLine()
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    let maxNumber = numbers.max()!
    
    var candidates = [Bool](repeating: true, count: maxNumber + 1)
    (0...1).forEach { candidates[$0] = false }
    
    var p = 2
    while p * p <= maxNumber {
        if candidates[p] {
            var powered = p * p
            
            while powered <= maxNumber {
                candidates[powered] = false
                powered += p
            }
        }
        
        p += 1
    }
    
    // let primes = candidates.enumerated().compactMap { $1 ? $0 : nil }
    
    print(numbers.reduce(0) { $0 + (candidates[$1] ? 1 : 0)  })
}

func Q_1978_뭐함() {
    _ = readLine()
    // 1은 소수가 아니며, 2는 유일한 짝수 소수이다.
    let primes = Set([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997])
    
    print(readLine()!.split(separator: " ").reduce(0) {
        $0 + (primes.contains(Int($1)!) ? 1 : 0)
    })
}

/*
 소수 찾기 https://www.acmicpc.net/problem/1978
 
 문제
 주어진 수 N개 중에서 소수가 몇 개인지 찾아서 출력하는 프로그램을 작성하시오.

 입력
 첫 줄에 수의 개수 N이 주어진다. N은 100이하이다. 다음으로 N개의 수가 주어지는데 수는 1,000 이하의 자연수이다.

 출력
 주어진 수들 중 소수의 개수를 출력한다.

 예제 입력 1
4
1 3 5 7
 
 예제 출력 1
 3
 */
