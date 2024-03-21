//
//  2559.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/20/2024.
//
//  2: 수열 https://www.acmicpc.net/problem/2559
//

import Foundation

/// 수열 https://www.acmicpc.net/problem/2559
func Q_2559() {
    let k = readLine()!.split(separator: " ").map { Int($0)! }[1]
    var numbers = [0] + readLine()!.split(separator: " ").map { Int($0)! }
    
    for i in 2..<numbers.count {
        numbers[i] += numbers[i - 1]
    }
    
    var maxTemp = Int.min
    for i in k..<numbers.count {
        maxTemp = max(maxTemp, numbers[i] - numbers[i - k])
        // numbers[(i - k) - 1 + 1] 이기 때문에 상쇄되므로 numbers[i - k]
    }
    
    print(maxTemp)
}

/*
 [풀이]
 - 구간합 구하기(11659) 슬라이딩 윈도우 기법 응용
 - 시작-끝은 (i)~(i-k+1) => 슬라이딩 윈도우에서 끝 인덱스는 1 빼므로
   => (i)~(i-k+1-1) => 계산 범위는 (i)-(i-k) 임에 주의
 */
