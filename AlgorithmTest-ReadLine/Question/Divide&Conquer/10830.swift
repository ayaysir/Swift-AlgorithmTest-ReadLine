//
//  10830.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/23/2024.
//
//  7: 행렬 제곱 https://www.acmicpc.net/problem/10830
//

import Foundation

/// 행렬 제곱 https://www.acmicpc.net/problem/10830
func Q_10830() {
    let nb = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, b) = (nb[0], nb[1])
    let a = (0..<n).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
    let P = 1000
    
    func multi(_ a: [[Int]], _ a2: [[Int]]) -> [[Int]] {
        var result = Array(repeating: Array(repeating: 0, count: a.count), count: a.count)
        for i in 0..<a.count {
            for j in 0..<a.count {
                for l in 0..<a[0].count {
                   result[i][j] += a[i][l] * a2[l][j] % P
                }
            }
        }
        
        return result
    }
    
    func recursive(_ a: [[Int]], _ b: Int) -> [[Int]] {
        if b == 1 { // base condition
            return a
        }
        
        let next = recursive(a, b / 2) // O(logN)으로 만들기 위함
        return b % 2 == 0 ? multi(next, next) : multi(multi(next, next), a)
        // 거듭제곱 횟수 홀/짝에 따라 분기
    }
    
    var result = recursive(a, b)
    for i in 0..<n {
        for j in 0..<n {
            result[i][j] %= P
        }
    }
    
    result.forEach { print($0.map(String.init).joined(separator: " ")) }
}

/*
 [풀이] https://edder773.tistory.com/157
 1. 행렬의 제곱을 구하기 위해선 먼저 행렬의 곱셈 연산을 해줘야 한다. 행렬의 곱을 먼저 만들어주자. (multi 함수)
 2. 이제 행렬의 곱을 구했으니,
  - "제곱"은 이 곱을 반복하는 연산이고, 빠르게 곱을 하기 위해서
  - "분할 정복" 개념을 사용해서 제곱을 구성해주자.
 3. 문제 요구조건대로 1000으로 나눈 나머지를 구해서 출력해주면 된다.
 
 ---------
 
 문제
 크기가 N*N인 행렬 A가 주어진다. 이때, A의 B제곱을 구하는 프로그램을 작성하시오. 수가 매우 커질 수 있으니, A^B의 각 원소를 1,000으로 나눈 나머지를 출력한다.

 입력
 첫째 줄에 행렬의 크기 N과 B가 주어진다. (2 ≤ N ≤  5, 1 ≤ B ≤ 100,000,000,000)

 둘째 줄부터 N개의 줄에 행렬의 각 원소가 주어진다. 행렬의 각 원소는 1,000보다 작거나 같은 자연수 또는 0이다.

 출력
 첫째 줄부터 N개의 줄에 걸쳐 행렬 A를 B제곱한 결과를 출력한다.

 예제 입력 1
 2 5
 1 2
 3 4
 
 예제 출력 1
 69 558
 337 406
 
 예제 입력 2
 3 3
 1 2 3
 4 5 6
 7 8 9
 
 예제 출력 2
 468 576 684
 62 305 548
 656 34 412
 
 예제 입력 3
 5 10
 1 0 0 0 1
 1 0 0 0 1
 1 0 0 0 1
 1 0 0 0 1
 1 0 0 0 1
 
 예제 출력 3
 512 0 0 0 512
 512 0 0 0 512
 512 0 0 0 512
 512 0 0 0 512
 512 0 0 0 512
 */
