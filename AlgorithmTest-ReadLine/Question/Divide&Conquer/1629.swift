//
//  1629.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/23/2024.
//
//  4: 곱셈 https://www.acmicpc.net/problem/1629
//

import Foundation

/// 곱셈 https://www.acmicpc.net/problem/1629
func Q_1629() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (r[0], r[1], r[2])

    func recursive(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }

        if n % 2 != 0 {
            return a * recursive(n - 1)
        }

        let next = recursive(n / 2) % c
        return next * next % c
    }

    print(recursive(b) % c) // % c 빼면 틀림 (나머지가 안된 상태)
    
    /*
     [되는거]
     if n % 2 != 0 {
         return a * recursive(n - 1) % c
     }

     let next = recursive(n / 2)
     return next % c * next % c
     
     --------
     
     if n % 2 != 0 {
         return a * recursive(n - 1)
     }

     let next = recursive(n / 2) % c
     return next * next % c
     
     --------
     
     if n % 2 != 0 {
         return a * recursive(n - 1)
     }

     let next = recursive(n / 2) % c
     return next % c * next % c
     
     --------
     
     [안되는거]
     
     if n % 2 != 0 {
         return a * recursive(n - 1)
     }

     let next = recursive(n / 2)
     return next % c * next % c
     
     --------
     
     if n % 2 != 0 {
         return a * recursive(n - 1) % c
     }

     let next = recursive(n / 2)
     return next * next % c
     
     */
}

func Q_1629_() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (r[0], r[1], r[2])

    func recursive(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }

        if n % 2 == 0 {
             let next = recursive(n / 2)
             return next % c * next % c
         } else {
             let next = recursive((n - 1) / 2)
             return next % c * next % c * a % c
        }
    }

    print(recursive(b)) // % c 해도 결과동일
}

/// 곱셈 https://www.acmicpc.net/problem/1629
func Q_1629_실패() {
    // import Foundation
    
    let r = readLine()!.split(separator: " ").map { Double($0)! }
    let (a, b, c) = (r[0], r[1], r[2])
    
    print(Int((pow(a.truncatingRemainder(dividingBy: c), b)).truncatingRemainder(dividingBy: c)))
}

/*
 [풀이] 
 https://st-lab.tistory.com/237
 https://siwon-code.tistory.com/53
 
 1. (A^B % C) == (A^B/2 %C) * (A^B/2 % C)
 2. 1번 식을 재귀로 반복
 
 [💥💥💥] 런타임 에러 => 산술 오버플로
 [반례]
2147483647 2147483647 100001
 - answer: 7569
 - 에러: 190776004748539 또는 artihmetic overflow
 
 [참고] 연산자 우선순위 https://www.programiz.com/swift-programming/operator-precedence-associativity
 - '%' 은 *, / 와 동등한 우선순위를 가진다
 - 괄호를 잘못치면 의도와 다른 결과가 발생할 수 있다.
 - next % c * next % c * a % c은 (next % c) * (next % c) * (a % c) 가 아니다.
 - 지수법칙과 Modulo 법칙을 공부한다.
 ---------------------
 
 문제
 자연수 A를 B번 곱한 수를 알고 싶다. 단 구하려는 수가 매우 커질 수 있으므로 이를 C로 나눈 나머지를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 A, B, C가 빈 칸을 사이에 두고 순서대로 주어진다. A, B, C는 모두 2,147,483,647 이하의 자연수이다.

 출력
 첫째 줄에 A를 B번 곱한 수를 C로 나눈 나머지를 출력한다.

 예제 입력 1
10 11 12
 
 예제 출력 1
 4
 */
