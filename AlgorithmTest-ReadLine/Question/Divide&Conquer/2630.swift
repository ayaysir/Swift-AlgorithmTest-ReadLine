//
//  2630.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/23/2024.
//
//  1: 색종이 만들기 https://www.acmicpc.net/problem/2630
//

import Foundation

/// 색종이 만들기 https://www.acmicpc.net/problem/2630
func Q_2630() {
    let n = Int(readLine()!)!
    let A = (0..<n).map { _ in readLine()!.split(separator: " ").map(String.init) }
    var result = ["0": 0, "1": 0]
    
    // 2 1
    // 3 4
    func recursive(_ y: Int, _ x: Int, _ size: Int) {
        if isAllOneColor(y, x, size) {
            result[A[y][x]]! += 1
            return
        }
        
        let size = size / 2
        for i in 0...1 {
            for j in 0...1 {
                recursive(y + size * i, x + size * j, size)
            }
        }
    }
    
    func isAllOneColor(_ y: Int, _ x: Int, _ size: Int) -> Bool {
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
    print("\(result["0"]!)\n\(result["1"]!)")
}

/*
 [풀이]
 - 사이즈를 2로 나눠가며 재귀
  - 4등분 해야하므로 가로, 세로는 각각 (/ 2)
  - 9등분인 경우 각각 (/ 3)
 - 종료 조건에서 영역 판단: 모든 영역이 a[y][x]와 동일한 경우 true, 한 개라도 다르면 false
 */
