//
//  2738.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/11/24.
//

import Foundation

func Q_2738() {
    let ip1 = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (ip1[0], ip1[1])
    var matrix: [[Int]] = .init(repeating: .init(repeating: 0, count: m), count: n)

    var output = ""
    (0..<2).forEach { a in
        (0..<n).forEach { i in
            readLine()!.split(separator: " ").map { Int($0)! }.enumerated().forEach { j, v in
                matrix[i][j] += v
                
                if a == 1 {
                    output += "\(matrix[i][j]) "
                }
            }
            
            if a == 1 {
                output += "\n"
            }
        }
    }

    print(output)
}

/*
행렬 덧셈 https://www.acmicpc.net/problem/2738

예제 입력 1
3 3
1 1 1
2 2 2
0 1 0
3 3 3
4 4 4
5 5 100

예제 출력 1
4 4 4
6 6 6
5 6 100
 */
