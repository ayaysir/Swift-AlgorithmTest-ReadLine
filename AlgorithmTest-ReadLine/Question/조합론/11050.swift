//
//  11050.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/12/24.
//

import Foundation

func Q_11050() {
    func factorial(_ n: Int) -> Int {
        n <= 1 ? 1 : n * factorial(n - 1)
    }
    
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (r[0], r[1])
    print(factorial(n) / (factorial(k) * factorial(n - k)))
}

/*
이항 계수 1 https://www.acmicpc.net/problem/11050

문제
자연수 N과 정수 K가 주어졌을 때 이항 계수 (N K)를 구하는 프로그램을 작성하시오.

입력
첫째 줄에 N과 K가 주어진다. (1 ≤ N ≤ 10, 0 ≤ K ≤ N)

출력
이항계수 (N K) 를 출력한다.

예제 입력 1
5 2
예제 출력 1
10
*/
