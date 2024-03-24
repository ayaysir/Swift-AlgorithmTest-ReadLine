//
//  1780.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/23/2024.
//
//  3: 종이의 개수 https://www.acmicpc.net/problem/1780
//

import Foundation

/// 종이의 개수 https://www.acmicpc.net/problem/1780
func Q_1780() {
    let n = Int(readLine()!)!
    let A = (0..<n).map { _ in readLine()!.split(separator: " ").map(String.init) }
    var result = ["0": 0, "1": 0, "-1": 0]
    
    func recursive(_ y: Int = 0, _ x: Int = 0, _ size: Int = n) {
        if isAllSame(y, x, size) {
            result[A[y][x]]! += 1
            return
        }
        
        let size = size / 3
        for i in 0...2 {
            for j in 0...2 {
                recursive(y + size * i, x + size * j, size)
            }
        }
    }
    
    func isAllSame(_ y: Int, _ x: Int, _ size: Int) -> Bool {
        for i in 0..<size {
            for j in 0..<size {
                if A[y+i][x+j] != A[y][x] {
                    return false
                }
            }
        }
        
        return true
    }
    
    recursive(0, 0, n)
    print("\(result["-1"]!)\n\(result["0"]!)\n\(result["1"]!)")
}

/*
 문제
 N×N크기의 행렬로 표현되는 종이가 있다. 종이의 각 칸에는 -1, 0, 1 중 하나가 저장되어 있다. 우리는 이 행렬을 다음과 같은 규칙에 따라 적절한 크기로 자르려고 한다.

 만약 종이가 모두 같은 수로 되어 있다면 이 종이를 그대로 사용한다.
 (1)이 아닌 경우에는 종이를 같은 크기의 종이 9개로 자르고, 각각의 잘린 종이에 대해서 (1)의 과정을 반복한다.
 이와 같이 종이를 잘랐을 때, -1로만 채워진 종이의 개수, 0으로만 채워진 종이의 개수, 1로만 채워진 종이의 개수를 구해내는 프로그램을 작성하시오.

 입력
 첫째 줄에 N(1 ≤ N ≤ 37, N은 3k 꼴)이 주어진다. 다음 N개의 줄에는 N개의 정수로 행렬이 주어진다.

 출력
 첫째 줄에 -1로만 채워진 종이의 개수를, 둘째 줄에 0으로만 채워진 종이의 개수를, 셋째 줄에 1로만 채워진 종이의 개수를 출력한다.

 예제 입력 1
 9
 0 0 0 1 1 1 -1 -1 -1
 0 0 0 1 1 1 -1 -1 -1
 0 0 0 1 1 1 -1 -1 -1
 1 1 1 0 0 0 0 0 0
 1 1 1 0 0 0 0 0 0
 1 1 1 0 0 0 0 0 0
 0 1 -1 0 1 -1 0 1 -1
 0 -1 1 0 1 -1 0 1 -1
 0 1 -1 1 0 -1 0 1 -1
 
 예제 출력 1
 10
 12
 11
 */
