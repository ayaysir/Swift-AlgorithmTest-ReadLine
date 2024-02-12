//
//  2903.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/12/24.
//

import Foundation

func Q_2903() {
    let base = 3 + 2 * (pow(2, Int(readLine()!)! - 1) - 1)
    print(base * base)
}

/*
 중앙 이동 알고리즘 https://www.acmicpc.net/problem/2903
 
 2의 거듭제곱들의 합을 일반화한 식은 다음과 같습니다.
 S=2⋅(2^n − 1)
 n개의 2의 거듭제곱을 모두 더한 값을 나타냅니다.
 */
