//
//  2110.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/25/2024.
//
//  5: 공유기 설치 https://www.acmicpc.net/problem/2110
//

import Foundation

/// 공유기 설치 https://www.acmicpc.net/problem/2110
func Q_2110() {
    let cmd = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, c) = (cmd[0], cmd[1])
    let stalls = (0..<n).map { _ in Int(readLine()!)! }.sorted()
    
    var (start, end) = (1, stalls.last! - stalls.first!)
    var result = 0
    
    if c == 2 {
        print(end)
        // 마구간이 2개라면 무조건 처음, 마지막 집 사이의 거리
    } else {
        while start < end {
            let mid = (start + end) / 2 // 찾고자 하는 거리
            var count = 1
            var targetStall = stalls[0]
            
            // i 마구간과 바로 직전 마구간의 (targetStall) 거리가 mid 보다 같거나 크다면
            for i in 0..<n where stalls[i] - targetStall >= mid {
                count += 1
                targetStall = stalls[i] // 타깃 마구간 갱신
            }
            
            if count >= c {
                // count가 소 마리(c)보다 같거나 더 크다면
                result = mid // 정답의 가능성이 있으므로 할당
                start = mid + 1 // mid 늘려보기 (다음 턴에서 늘어남)
            } else {
                end = mid
                // count가 c보다 작다면 소간 거리가 넓어 예제조건을 충족하지 못하므로
                // mid(거리 간격)를 더 좁혀야 한다.
                // end를 좁히면 다음 턴에서 mid가 반으로 줄어든다.
            }
        }
        
        print(result)
    }
}

/*
 [풀이] https://my-coding-notes.tistory.com/119
 🛖🛖  🛖      🛖🛖
 1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣8️⃣9️⃣
 
 - 이분 탐색을 수행: 마구간 사이의 최소 거리(1)와 최대 거리(last-first)의 중앙인 (1+8)/2 = 4 (몫만 이용)
 - 현재 마구간에서 다음 마구간의 거리가 mid를 초과한다면 소를 배치할 수 있게 된다.
 - 예) 소 배치 간격(mid)을 4 라고 할 때, 배치 가능한 소는 2마리이다.
     - 이는 C = 3이라는 예제 조건을 충족하지 못한다. 따라서 간격을 좁히면 된다. (end = mid)
     - mid = 3인 경우 1, 4, 8/9 에 3마리를 배치할 수 있다. C = 3을 충족
 - 간격을 좁힌 뒤 실행한 결과 공유기의 개수가 C를 초과한다면 간격을 다시 넓히면 된다. (start = mid + 1)
 
 [참고]
 - 문제의 한국어 의역이 개판이라 영어 원문이 더 이해가 잘되는 특이한 사례
 
 -------------
 
 Aggressive cows
 
 문제
 Farmer John has built a new long barn, with N (2 <= N <= 200,000) stalls. The stalls are located along a straight line at positions x1,...,xN (0 <= xi <= 1,000,000,000).

 His C (2 <= C <= N) cows don't like this barn layout and become aggressive towards each other once put into a stall. To prevent the cows from hurting each other, FJ want to assign the cows to the stalls, such that the minimum distance between any two of them is as large as possible. What is the largest minimum distance?
 
 입력
 Line 1: Two space-separated integers: N and C
 Lines 2..N+1: Line i+1 contains an integer stall location, xi
 
 출력
 Line 1: One integer: the largest minimum distance
 
 예제 입력 1
 5 3
 1
 2
 8
 4
 9
 
 예제 출력 1
 3
 */
