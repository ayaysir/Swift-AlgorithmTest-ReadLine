//
//  14889.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/16/24.
//

// import Foundation

func Q_14889() {
    let n = Int(readLine()!)!
    var matrix = [[Int]]()
    for _ in 0..<n {
        matrix.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    let totalMembers = [Int](0..<n)
    var startMembers = [0] // 0번 사람은 start 팀 고정
    var minDiff: Int = .max
    
    /// 특정 team 멤버들끼리의 합을 matrix에서 찾아 계산 및 반환
    /// - 이중 for문으로 같은 팀 멤버들끼리 조합
    /// - i와 j가 같은 경우 0이므로 더하더라도 영향 없음
    func sum(_ team: [Int]) -> Int {
        var sum = 0
        for i in 0..<team.count {
            for j in 0..<team.count {
                sum += matrix[team[i]][team[j]]
            }
        }
        
        return sum
    }
    
    /// x는 현재 인덱스, depth는 ??
    /// - depth 절반까지 온 경우 팀을 분할할 수 있으므로 차이 계산
    func backtracking(_ x: Int = 0, _ depth: Int = 1) {
        if depth == n / 2 {
            let linkMembers = totalMembers.filter { !startMembers.contains($0) }
            let (startSum, linkSum) = (sum(startMembers), sum(linkMembers))
            
            minDiff = min(minDiff, abs(startSum - linkSum))
            return // 없어도 결과 똑같음 (backtracking을 더이상 호출하지 않으므로)
        }
        
        // [💥💥💥] x가 아니라 x+1부터 시작
        // 8명인 경우 i = [a(=>x+1), b(=>y+1), c(=>z+1)], depth = [1, 2, 3, 4(종료 트리거)]
        // 0번은 start팀 고정이므로 4:4로 분할됨
        for i in (x + 1)..<n  {
            startMembers.append(i)
            backtracking(i, depth + 1)
            startMembers.removeLast()
        }
    }
    
    backtracking()
    print(minDiff)
}

/*
[풀이] https://www.acmicpc.net/source/73271716

-------------------------

스타트와 링크 https://www.acmicpc.net/problem/14889

문제
오늘은 스타트링크에 다니는 사람들이 모여서 축구를 해보려고 한다. 축구는 평일 오후에 하고 의무 참석도 아니다. 축구를 하기 위해 모인 사람은 총 N명이고 신기하게도 N은 짝수이다. 이제 N/2명으로 이루어진 스타트 팀과 링크 팀으로 사람들을 나눠야 한다.

BOJ를 운영하는 회사 답게 사람에게 번호를 1부터 N까지로 배정했고, 아래와 같은 능력치를 조사했다. 능력치 Sij는 i번 사람과 j번 사람이 같은 팀에 속했을 때, 팀에 더해지는 능력치이다. 팀의 능력치는 팀에 속한 모든 쌍의 능력치 Sij의 합이다. Sij는 Sji와 다를 수도 있으며, i번 사람과 j번 사람이 같은 팀에 속했을 때, 팀에 더해지는 능력치는 Sij와 Sji이다.

N=4이고, S가 아래와 같은 경우를 살펴보자.

i\j |  1    2    3    4
---------------------------
1  |  .    1    2    3
2  |  4    .    5    6
3  |  7    1    .    2
4  |  3    4    5    .

예를 들어, 1, 2번이 스타트 팀, 3, 4번이 링크 팀에 속한 경우에 두 팀의 능력치는 아래와 같다.

스타트 팀: S(12) + S(21) = 1 + 4 = 5
링크 팀: S(34) + S(43) = 2 + 5 = 7
1, 3번이 스타트 팀, 2, 4번이 링크 팀에 속하면, 두 팀의 능력치는 아래와 같다.

스타트 팀: S(13) + S(31) = 2 + 7 = 9
링크 팀: S(24) + S(42) = 6 + 4 = 10
축구를 재미있게 하기 위해서 스타트 팀의 능력치와 링크 팀의 능력치의 차이를 최소로 하려고 한다. 위의 예제와 같은 경우에는 1, 4번이 스타트 팀, 2, 3번 팀이 링크 팀에 속하면 스타트 팀의 능력치는 6, 링크 팀의 능력치는 6이 되어서 차이가 0이 되고 이 값이 최소이다.

입력
첫째 줄에 N(4 ≤ N ≤ 20, N은 짝수)이 주어진다. 둘째 줄부터 N개의 줄에 S가 주어진다. 각 줄은 N개의 수로 이루어져 있고, i번 줄의 j번째 수는 S(ij) 이다. S(ii)는 항상 0이고, 나머지 S(ij)는 1보다 크거나 같고, 100보다 작거나 같은 정수이다.

출력
첫째 줄에 스타트 팀과 링크 팀의 능력치의 차이의 최솟값을 출력한다.

예제 입력 1
4
0 1 2 3
4 0 5 6
7 1 0 2
3 4 5 0
예제 출력 1
0

예제 입력 2
6
0 1 2 3 4 5
1 0 2 3 4 5
1 2 0 3 4 5
1 2 3 0 4 5
1 2 3 4 0 5
1 2 3 4 5 0
예제 출력 2
2

예제 입력 3
8
0 5 4 5 4 5 4 5
4 0 5 1 2 3 4 5
9 8 0 1 2 3 1 2
9 9 9 0 9 9 9 9
1 1 1 1 0 1 1 1
8 7 6 5 4 0 3 2
9 1 9 1 9 1 0 9
6 5 4 3 2 1 9 0
예제 출력 3
1

힌트
예제 2의 경우에 (1, 3, 6), (2, 4, 5)로 팀을 나누면 되고, 예제 3의 경우에는 (1, 2, 4, 5), (3, 6, 7, 8)로 팀을 나누면 된다.

*/
