//
//  2740.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/23/2024.
//
//  6: 행렬 곱셈 https://www.acmicpc.net/problem/2740
//

import Foundation

/// 행렬 곱셈 https://www.acmicpc.net/problem/2740
func Q_2740() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    let a = (0..<n).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
    
    // m 은 반드시 동일해야한다.
    let k = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let b = (0..<m).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
    
    var result = Array(repeating: Array(repeating: 0, count: k), count: n)
    
    for i in 0..<n {
        for j in 0..<k {
            for l in 0..<m {
                // 굳이 (m-1)-l로 할 필요 없음.
                // a[i][⭐️] * b[⭐️][j] ⭐️만 동일하면 되므로 오름차순으로 해도 된다.
               result[i][j] += a[i][l] * b[l][j]
            }
        }
    }
    
    result.forEach { print($0.map(String.init).joined(separator: " ")) }
}

/*
 [풀이]
 
 +---+---+---------+---------+---------+---------+
 |       |    g    |    h    |    i    |    j    |
 +   = 2 +---------+---------+---------+---------+
 |   2   |    k    |    l    |    m    |    n    |
 +---+---+---------+---------+---------+---------+
 | a | b | bk + ag | bl + ah | bm + ai | bn + aj |
 +---+---+---------+---------+---------+---------+
 | c | d | dk + cg | dl + ch | dm + ci | dn + cj |
 +---+---+---------+---------+---------+---------+
 | e | f | fk + eg | fl + eh | fm + ei | fn + ej |
 +---+---+---------+---------+---------+---------+
 
 - 행렬곱셈은 하나의 행렬의 행과 다른 행렬의 열의 개수가 같아야 함 (m = m)
 - 결과 행렬의 크기는 1행렬의 행개수 * 2행렬의 열개수 이다.
 - 3중 for문으로 i는 결과 행렬의 행, j는 결과 행렬의 열을 움직이면서,
 - l은 1행렬의 행과, 2행렬에 대응하는 열을 순회한다.
 - result[i][j] += a[i][l] * b[l][j]
 
 ---------
 
 문제
 N*M크기의 행렬 A와 M*K크기의 행렬 B가 주어졌을 때, 두 행렬을 곱하는 프로그램을 작성하시오.

 입력
 첫째 줄에 행렬 A의 크기 N 과 M이 주어진다. 둘째 줄부터 N개의 줄에 행렬 A의 원소 M개가 순서대로 주어진다. 그 다음 줄에는 행렬 B의 크기 M과 K가 주어진다. 이어서 M개의 줄에 행렬 B의 원소 K개가 차례대로 주어진다. N과 M, 그리고 K는 100보다 작거나 같고, 행렬의 원소는 절댓값이 100보다 작거나 같은 정수이다.

 출력
 첫째 줄부터 N개의 줄에 행렬 A와 B를 곱한 행렬을 출력한다. 행렬의 각 원소는 공백으로 구분한다.

 예제 입력 1
 3 2
 1 2
 3 4
 5 6
 2 3
 -1 -2 0
 0 0 3
 
 예제 출력 1
 -1 -2 6
 -3 -6 12
 -5 -10 18
 */
