//
//  9506.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/13/24.
//

import Foundation

func Q_9506() {
    while let r = readLine(), let n = Int(r), n != -1 {
        // 최초 다섯 개의 완전수는 6, 28, 496, 8128, 33550336이다.
        let perfects = [
            6: "1 + 2 + 3",
            28: "1 + 2 + 4 + 7 + 14",
            496: "1 + 2 + 4 + 8 + 16 + 31 + 62 + 124 + 248",
            8128: "1 + 2 + 4 + 8 + 16 + 32 + 64 + 127 + 254 + 508 + 1016 + 2032 + 4064",
        ]
        
        if let perfect = perfects[n] {
            print(n, "=", perfect)
        } else {
            print(n, "is NOT perfect.")
        }
    }
}

/*
 약수들의 합 https://www.acmicpc.net/problem/9506
 - 완전수 구하기 (https://ko.wikipedia.org/wiki/완전수)
 - 2 < n < 100,000인데 해당 범위 완전수는 4개밖에 안됨 (6, 28, 496, 8128)
 
 예제 입력 1
6
12
28
-1
 
 예제 출력 1
 6 = 1 + 2 + 3
 12 is NOT perfect.
 28 = 1 + 2 + 4 + 7 + 14
 */
