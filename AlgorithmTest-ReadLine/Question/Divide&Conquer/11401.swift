//
//  11401.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/23/2024.
//
//  5: 이항 계수 3 https://www.acmicpc.net/problem/11401
//

import Foundation

/// 이항 계수 3 https://www.acmicpc.net/problem/11401
func Q_11401() {
    let P = 1_000_000_007

    func factorial(_ n: Int) -> Int {
        var result = 1, n = n
        
        while n > 1 {
            result = (result * n) % P
            n -= 1
        }
        
        return result
    }
    
    func recursive(_ base: Int, _ exp: Int) -> Int {
        if exp == 1 {
            return base % P
        }
        
        let next = recursive(base, exp / 2)
        
        if exp % 2 == 1 {
            return next * next % P * base % P
        }
        
        return next * next % P
    }
    
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (r[0], r[1])
    
    let numerator = factorial(n)
    let denominator = factorial(k) * factorial(n - k) % P
    print(numerator * recursive(denominator, P - 2) % P)
}

func Q_11401_repetive() {
    let P = 1_000_000_007

    func factorial(_ n: Int) -> Int {
        var result = 1, n = n
        
        while n > 1 {
            result = (result * n) % P
            n -= 1
        }
        
        return result
    }
    
    func repetive(_ base: Int, _ exp: Int) -> Int {
        var (result, base, exp) = (1, base, exp)
        
        while exp > 0 {
            if exp % 2 == 1 {
                result *= base
                result %= P
            }
            
            base = base * base % P
            exp /= 2
        }
        
        return result
    }
    
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (r[0], r[1])
    
    let numerator = factorial(n)
    let denominator = factorial(k) * factorial(n - k) % P
    print(numerator * repetive(denominator, P - 2) % P)
}

/*
 [풀이]
 https://st-lab.tistory.com/241
 https://velog.io/@ledcost/백준-11401-파이썬-이항-계수-3-골드1-분할-정복
 
 (하나도 모르겠음.. 나중에 반드시 복습)
 
 - 이항계수: n! / k!(n-k)!
 - 1 ≤ N ≤ 4,000,000으로 통상적으로 풀면 산술 오버플로, 시간 초과 등 에러 발생할 것
 - 모듈러의 연산 공식을 활용해야 하는데, 모듈러 연산에서 나눗셈 연산은 '없다'.
   => 분수 형식을 곱셈 꼴로 만들면 된다는 것이다.
 - 역원을 이용하여 곱셈 꼴로 만들면 된다.
   - 역원 => 두 원소를 연산한 결과가 항등원일 때, 한 편에 대하여 다른 편을 이르는 말
   - 항등원 => 임의의 원소 a에 대하여 ae=ea=a를 만족하는 원소 e
 - 역원을 이용한 변환: a / x = T => a * x^(-1) = T
   - 곱셈 꼴로 변환되기 때문에 모듈러 연산의 곱셈에 대한 분배법칙을 적용할 수 있다.
 
   n! / k!(n-k)! % p = [n! * {k!(n-k)!}^(-1)] % p
                     = [(n!%p) * {k!(n-k)!}^(-1)%p] % p (<=곱셉 분배법칙)
 
 [페르마의 소정리]
 - (K! (N-K)!) 의 역원을 구할 때, 분수가 아닌 정수 곱셈으로 표현될 수 있어야 한다.
 - 정의:
       a는 정수, p는 소수이며 a ⫮ p (a는 p로 나뉘지 않음, a는 p의 배수가 아님) 일 때,
       a^p ≡ a( % p) => a^p % p ≡ a % p
                보조정리  a^(p-1) ≡ 1 ( % p) = a * a^(p-2) ≡ 1( % p)
       즉, a( % p)에 대한 역원은  a^(p-2) (% p) 이다. (<= ???)
       역원 식을 a로 대치
       a = (k!(n-k)!), p = 1_000_000_007
       (k!(n-k)!)^(-1) = (k!(n-k)!)^(1_000_000_007-2)
 
 즉, (K! (N-K)!)1000000007-2 는 정수로 표현되기 때문에 이제 이를 곱셈 분배 법칙으로 변환하여 만들 수 있다.
 
      [n! / k!(n-k)!] % p = [n! * (k!(n-k)!)^(-1)] % p
                          = [(n! % p) * {(k!(n-k)!)^(-1)} % p] % p
                          = [(n! % p) * {(k!(n-k)!)^(1_000_000_007-2)} % p] % p

  - 분할 정복은 (K! (N-K)!)^(1000000007-2) 에서 이용됨
 */
