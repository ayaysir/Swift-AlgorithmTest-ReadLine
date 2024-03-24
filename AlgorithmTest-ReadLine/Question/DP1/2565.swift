//
//  2565.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/19/24.
//

// import Foundation

func Q_2565() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 1, count: 100)
    var polePairs: [(l: Int, r: Int)] = []
    
    for _ in 0..<n {
        // withUnsafeBytes: array to tuple
        polePairs.append(
            readLine()!
                .split(separator: " ")
                .map { Int($0)! }
                .withUnsafeBytes { $0.bindMemory(to: (l: Int, r: Int).self)[0] }
        )
    }
    
    polePairs.sort { $0.l < $1.l }
    
    for i in stride(from: 1, to: n, by: 1) {
        for j in stride(from: 0, to: i, by: 1) where polePairs[j].r < polePairs[i].r {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
    
    print(n - dp.max()!)
}

/*
 [풀이] https://yabmoons.tistory.com/572
 1. 왼쪽 전봇대를 기준으로 정렬을 시켜준다.
 2. 오른쪽 전봇대에서 "가장 긴 증가하는 부분 수열"을 구해준다.
  - 왼쪽이 오름차순 정렬되어 있는 상태에서 오른쪽도 오름차순으로 증가하고 있다면 서로 방해하지 않으며, 겹치지도 않은 것이다.
  - 그림 참조: 오른쪽도 오름차순 정렬된 상태, 방해되는 전선을 제거해봐라
 3. 2번과정에서 구한 "가장 긴 증가하는 부분 수열"의 크기를 N에서 빼준다.
  - 전체 전봇대 숫자에서 안정적으로 증가하는 오른쪽 부분 수열의 개수를 빼면 나머지는 수열을 너머 교차하는 전선이므로 끊어준다.
 
 (1) 왼쪽 전봇대 오름차순 정렬
 1 - 8
 2 - 2
 3 - 9
 4 - 1
 6 - 4
 7 - 6
 9 - 7
 10 - 10
 
 (2) 오른쪽 전봇대의 '가긴증부수' 구하기 => 1 4 6 7 10
 (3) 8 - 5 = 3
 
 
 -----------------
 
 전깃줄 https://www.acmicpc.net/problem/2565
 
 두 전봇대 A와 B 사이에 하나 둘씩 전깃줄을 추가하다 보니 전깃줄이 서로 교차하는 경우가 발생하였다. 합선의 위험이 있어 이들 중 몇 개의 전깃줄을 없애 전깃줄이 교차하지 않도록 만들려고 한다.

 예를 들어, < 그림 1 >과 같이 전깃줄이 연결되어 있는 경우 A의 1번 위치와 B의 8번 위치를 잇는 전깃줄, A의 3번 위치와 B의 9번 위치를 잇는 전깃줄, A의 4번 위치와 B의 1번 위치를 잇는 전깃줄을 없애면 남아있는 모든 전깃줄이 서로 교차하지 않게 된다.
 
 <그림 1>
 
 전깃줄이 전봇대에 연결되는 위치는 전봇대 위에서부터 차례대로 번호가 매겨진다. 전깃줄의 개수와 전깃줄들이 두 전봇대에 연결되는 위치의 번호가 주어질 때, 남아있는 모든 전깃줄이 서로 교차하지 않게 하기 위해 없애야 하는 전깃줄의 최소 개수를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에는 두 전봇대 사이의 전깃줄의 개수가 주어진다. 전깃줄의 개수는 100 이하의 자연수이다. 둘째 줄부터 한 줄에 하나씩 전깃줄이 A전봇대와 연결되는 위치의 번호와 B전봇대와 연결되는 위치의 번호가 차례로 주어진다. 위치의 번호는 500 이하의 자연수이고, 같은 위치에 두 개 이상의 전깃줄이 연결될 수 없다.

 출력
 첫째 줄에 남아있는 모든 전깃줄이 서로 교차하지 않게 하기 위해 없애야 하는 전깃줄의 최소 개수를 출력한다.

 예제 입력 1
8
1 8
3 9
2 2 
4 1
6 4
10 10
9 7
7 6
 
 예제 출력 1
 3
 */