//
//  1976.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/16/2024.
//
//  2: 여행 가자 https://www.acmicpc.net/problem/1976
//

import Foundation

/// 여행 가자 https://www.acmicpc.net/problem/1976
func Q_1976() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    
    var unf = Array(0...n)
    
    func find(_ x: Int) -> Int {
        if x == unf[x] {
            return x
        }
        
        unf[x] = find(unf[x])
        return unf[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let (x, y) = (find(x), find(y))
        
        guard x != y else {
            return
        }
        
        if x < y {
            unf[y] = x
        } else {
            unf[x] = y
        }
    }
    
    for i in 1...n {
        let cities = readLine()!.split(separator: " ").map { Int($0)! }
        for (j, c) in cities.enumerated() where c == 1 {
            union(i, j + 1)
        }
    }
    
    let plans = readLine()!.split(separator: " ").map { Int($0)! }
    var isAvailable = true
    for i in 1..<m where find(plans[i]) != find(plans[i - 1]) {
        isAvailable = false
    }

    print(isAvailable ? "YES" : "NO")
}

/*
[풀이]
 - 유니온 파인드 알고리즘 사용 (=> 해설은 1717번 문제)
 - 두 도시가 연결되어 있다면 union 작업 시행 (주의: one-based 인덱스 사용)
 - 여행 계획의 도시들이 연결되었는지 확인하려면 도시들마다 find(a) == find(b) 인지 여부 확인
   - 하나라도 어긋나있으면 연결이 안된것이므로 false, 모두 연결되어 있다면 true
 
 ---------
 
 문제
 동혁이는 친구들과 함께 여행을 가려고 한다. 한국에는 도시가 N개 있고 임의의 두 도시 사이에 길이 있을 수도, 없을 수도 있다. 동혁이의 여행 일정이 주어졌을 때, 이 여행 경로가 가능한 것인지 알아보자. 물론 중간에 다른 도시를 경유해서 여행을 할 수도 있다. 예를 들어 도시가 5개 있고, A-B, B-C, A-D, B-D, E-A의 길이 있고, 동혁이의 여행 계획이 E C B C D 라면 E-A-B-C-B-C-B-D라는 여행경로를 통해 목적을 달성할 수 있다.

 도시들의 개수와 도시들 간의 연결 여부가 주어져 있고, 동혁이의 여행 계획에 속한 도시들이 순서대로 주어졌을 때 가능한지 여부를 판별하는 프로그램을 작성하시오. 같은 도시를 여러 번 방문하는 것도 가능하다.

 입력
 첫 줄에 도시의 수 N이 주어진다. N은 200이하이다. 둘째 줄에 여행 계획에 속한 도시들의 수 M이 주어진다. M은 1000이하이다. 다음 N개의 줄에는 N개의 정수가 주어진다. i번째 줄의 j번째 수는 i번 도시와 j번 도시의 연결 정보를 의미한다. 1이면 연결된 것이고 0이면 연결이 되지 않은 것이다. A와 B가 연결되었으면 B와 A도 연결되어 있다. 마지막 줄에는 여행 계획이 주어진다. 도시의 번호는 1부터 N까지 차례대로 매겨져 있다.

 출력
 첫 줄에 가능하면 YES 불가능하면 NO를 출력한다.

 예제 입력 1
 3
 3
 0 1 0
 1 0 1
 0 1 0
 1 2 3
 
 예제 출력 1
 YES
 */
