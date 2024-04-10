//
//  13913.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/8/2024.
//
//  6: 숨바꼭질 4 https://www.acmicpc.net/problem/13913
//

import Foundation

/// 숨바꼭질 4 https://www.acmicpc.net/problem/13913
func Q_13913() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (r[0], r[1])
    /// visited 배열을 방문 및 어디서부터 왔는지 기록하는 용도로 사용
    /// (-1)인 경우 미방문, 0 이상인 경우 방문 및 이전 위치
    var visited = Array(repeating: -1, count: 100001)
    
    var result = 0
    func bfs() {
        let dirs = [{ $0 + 1 }, { $0 - 1 }, { $0 * 2 }]
        var q = [(p: n, d: 0)]
        var sIdx = 0
        
        while sIdx < q.count {
            let pop = q[sIdx]
            sIdx += 1
            
            if pop.p == k {
                result = pop.d
                break
            }
            
            for dir in dirs {
                let nx = dir(pop.p)
                
                // 10만까지 맵이 있으므로 10만1부터 불가처리해야됨
                if 0...100000 ~= nx && visited[nx] == -1 {
                    visited[nx] = pop.p
                    q.append((nx, pop.d + 1))
                }
            }
        }
    }
    
    if n == k {
        print("0\n\(k)")
    } else {
        bfs()
        print(result)
        
        var i = k, paths = [k]
        while visited[i] != n {
            i = visited[i]
            paths.append(i)
        }
        paths.append(n)
        
        print(paths.reversed().map(String.init).joined(separator: " "))
    }
}

/*
 [풀이]
 - 숨바꼭질 1 (1697번 문제) 에서 경로추적 추가
 - 기존의 visited: [Boolean] 배열을 visited: [Int]로 변환
   - 방문 여부와 이전 인덱스를 동시에 기록
   - nx가 방문하지 않은 곳(-1)일 때, visited[nx] = pop.p(현재 위치) 로 기록
 - 예외 처리 추가: n == k 인 경우 while visited[i] != n {...}에서 Index out of range에러가 발생
   - 기존 숨바꼭질 1 코드에서는 bfs()를 실행해도 예외가 발생하지 않았으나
   - 새로 바뀐 코드에서는 visited 배열이 전부 -1인 상태로 남아있으므로 visited[-1]에 접근하게 된다.
 
 ----------
 
 문제
 수빈이는 동생과 숨바꼭질을 하고 있다. 수빈이는 현재 점 N(0 ≤ N ≤ 100,000)에 있고, 동생은 점 K(0 ≤ K ≤ 100,000)에 있다. 수빈이는 걷거나 순간이동을 할 수 있다. 만약, 수빈이의 위치가 X일 때 걷는다면 1초 후에 X-1 또는 X+1로 이동하게 된다. 순간이동을 하는 경우에는 1초 후에 2*X의 위치로 이동하게 된다.

 수빈이와 동생의 위치가 주어졌을 때, 수빈이가 동생을 찾을 수 있는 가장 빠른 시간이 몇 초 후인지 구하는 프로그램을 작성하시오.

 입력
 첫 번째 줄에 수빈이가 있는 위치 N과 동생이 있는 위치 K가 주어진다. N과 K는 정수이다.

 출력
 첫째 줄에 수빈이가 동생을 찾는 가장 빠른 시간을 출력한다.

 둘째 줄에 어떻게 이동해야 하는지 공백으로 구분해 출력한다.

 예제 입력 1
 5 17
 예제 출력 1
 4
 5 10 9 18 17
 
 예제 입력 2
 5 17
 예제 출력 2
 4
 5 4 8 16 17
 
 [반례]
 24 300
 ans: 10
 24 23 22 21 20 19 38 76 75 150 300
 
 100 1
 ans: 99
 100~1까지 순서대로
 
 2 1024
 ans: 9
 2 4 8 16 32 64 128 256 512 1024
 
 5 4
 ans: 1
 5 4
 
 0 0
 ans: 0
 0
 
 0 1
 ans: 1
 0 1
 
 0 4
 ans: 3
 0 1 2 4
 
 4 4
 ans: 0
 4
 
 4 7
 ans: 2
 4 8 7    
 
 1 0
 ans: 1
 1 0
 
 ans: 1 5
 3
 1 2 4 5
 */
