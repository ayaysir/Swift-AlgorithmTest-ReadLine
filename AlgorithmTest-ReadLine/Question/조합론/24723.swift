//
//  24723.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/12/24.
//

import Foundation

func Q_24723() {
    print((0..<Int(readLine()!)!).reduce(1){c,_ in c*2})
}

/*
 녹색거탑 https://www.acmicpc.net/problem/24723
 - 문제 요약: 2^N을 구해라
 */
