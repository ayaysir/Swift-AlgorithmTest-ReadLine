//
//  17086.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/09/23.
//

import Foundation

/*
 참고: 1012번 문제
 */

func Q_17086() {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let N = input[0] // m은 열
    let M = input[1] // n은 행,
    
    var oceans = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    for n in 0..<N {
        oceans[n] = readLine()!.split(separator: " ").map { Int(String($0))! }
    }
    
    print(oceans)
    
    // 팔방향 탐색 (시계방향) => 해당 방향으로 나아감
    let dirX = [0, 1, 1, 1, 0, -1, -1, -1]
    let dirY = [-1, -1, 0, 1, 1, 1, 0, -1]
    
    var queue: [(x: Int, y: Int)] = []
    
    func bfs() {
        while !queue.isEmpty {
            let coord = queue.removeFirst()
            
            for i in 0..<dirX.count {
                let nextX = coord.x + dirX[i]
                let nextY = coord.y + dirY[i]
                
                if nextX < 0  || nextX >= M || nextY < 0 || nextY >= N {
                    continue
                }
                
                if oceans[nextY][nextX] == 0 {
                    oceans[nextY][nextX] = oceans[coord.y][coord.x] + 1
                    queue.append((nextX, nextY))
                }
            }
         }
    }
    
    for n in 0..<N {
        for m in 0..<M {
            if oceans[n][m] == 1 {
                queue.append((m, n))
            }
        }
    }
    
    bfs()
    // print(oceans)
    let result = oceans.flatMap { $0 }.max()! - 1
    print(result)
}
