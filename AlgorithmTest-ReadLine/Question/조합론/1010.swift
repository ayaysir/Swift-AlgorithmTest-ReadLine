//
//  1010.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/12/24.
//

import Foundation

func Q_1010_시간초과() {
    func combination(_ n: Int, _ r: Int) -> Int {
        // nCr = <n-1>C<r-1> + <n-1>C<r>
        (n == r || r == 0) ? 1 : combination(n - 1, r - 1) + combination(n - 1, r)
    }
    
    for _ in 0..<Int(readLine()!)! {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (c, n) = (r[0], r[1])
        
        print(combination(n, c))
    }
}

func Q_1010() {
    var combi = Array(repeating: Array(repeating: 0, count: 35), count: 35)
    func dfs(_ n: Int, _ r: Int) -> Int {
        if combi[n][r] > 0 {
            return combi[n][r]
        }
        
        if n == r || r == 0 {
            return 1
        }
        
        combi[n][r] = dfs(n - 1, r - 1) + dfs(n - 1, r)
        return combi[n][r]
    }
    
    for _ in 0..<Int(readLine()!)! {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (c, n) = (r[0], r[1])
        
        print(dfs(n, c))
    }
}

/*
[풀이]
https://okdolmin.tistory.com/68
일반적인 조합 구하는 재귀식은 시간초과가 발생하므로 메모이제이션을 사용한 방법으로 구한다.

-------------

다리 놓기 https://www.acmicpc.net/problem/1010

- 문제 요약 : mCn을 구해라

입력
입력의 첫 줄에는 테스트 케이스의 개수 T가 주어진다. 그 다음 줄부터 각각의 테스트케이스에 대해 강의 서쪽과 동쪽에 있는 사이트의 개수 정수 N, M (0 < N ≤ M < 30)이 주어진다.

출력
각 테스트 케이스에 대해 주어진 조건하에 다리를 지을 수 있는 경우의 수를 출력한다.

예제 입력 1
3
2 2
1 5
13 29

예제 출력 1
1
5
67863915
*/
