//
//  2156.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/19/24.
//

import Foundation

func Q_2156() {
    let n = Int(readLine()!)!
    var wines = Array(repeating: 0, count: 10001)
    
    for i in stride(from: 1, through: n, by: 1) {
        wines[i] = Int(readLine()!)!
    }
    
    var dp = Array(repeating: 0, count: 10001)
    dp[1] = wines[1]
    dp[2] = wines[1] + wines[2]
    dp[3] = max(wines[3] + wines[1], wines[3] + wines[2], dp[2])
    
    for i in stride(from: 4, through: n, by: 1) {
        dp[i] = max(wines[i] + wines[i-1] + dp[i-3], wines[i] + dp[i-2], dp[i-1])
     }
    
    print(dp.max()!)
}

/*
 [풀이]
 1차원 DP 배열을 만들고, dp[n]에 해당 턴까지 진행했을 때 얻을 수 있는 가장 큰 점수를 저장한다.
 dp[3]번까지는 기저 조건을 지정
 - dp[1]: 첫번째 와인을 마시는 것이 최선
 - dp[2]: 첫번째 + 두번째 전부 마시는 것이 최선
 - dp[3]: 3연속으로 마실 수 없으므로 두 개만 선택해야 함. 1+3, 2+3, 1+2(=dp[2]) 조합 중 가장 큰 값을 선택
 
 3개 연속으로 마시는 것이 불가능한 점에 주의해서, n번째 포도주에서 다음과 같은 판단을 할 수 있다.
 세 조건 중 가장 큰 값을 얻을 수 있는 경우를 선택해서 DP 배열에 저장한다.
 (1) 현재 와인 wines[i]을 마시고, 이전 와인 wines[i-1]을 마시면 이이전 와인은 마실 수 없다.
     이전 와인에서 두 칸 떨어진 곳에서 얻을 수 있는 가장 큰 결과 dp[i-3]를 더한다.
 (2) 현재 와인 wines[i]을 마시고, 이전 와인을 패스하면 이이전 와인을 마실 수 있다.
     이이전 와인을 마셨을 때 얻을 수 있는 가장 큰 결과 dp[i-2]를 더한다.
 (3) 현재 와인을 안 마시고 이전 와인을 마셨을 때 얻을 수 있는 가장 큰 결과 dp[i-1]를 그대로 가져온다.
 
 [주의]
 문제풀이 중에서 3번 조건을 빼먹어도 다수의 케이스가 풀리므로 착각하지 않도록 주의.
 
 ---------------------------
 포도주 시식 https://www.acmicpc.net/problem/2156
 
 효주는 포도주 시식회에 갔다. 그 곳에 갔더니, 테이블 위에 다양한 포도주가 들어있는 포도주 잔이 일렬로 놓여 있었다. 효주는 포도주 시식을 하려고 하는데, 여기에는 다음과 같은 두 가지 규칙이 있다.

 포도주 잔을 선택하면 그 잔에 들어있는 포도주는 모두 마셔야 하고, 마신 후에는 원래 위치에 다시 놓아야 한다.
 연속으로 놓여 있는 3잔을 모두 마실 수는 없다.
 효주는 될 수 있는 대로 많은 양의 포도주를 맛보기 위해서 어떤 포도주 잔을 선택해야 할지 고민하고 있다. 1부터 n까지의 번호가 붙어 있는 n개의 포도주 잔이 순서대로 테이블 위에 놓여 있고, 각 포도주 잔에 들어있는 포도주의 양이 주어졌을 때, 효주를 도와 가장 많은 양의 포도주를 마실 수 있도록 하는 프로그램을 작성하시오.

 예를 들어 6개의 포도주 잔이 있고, 각각의 잔에 순서대로 6, 10, 13, 9, 8, 1 만큼의 포도주가 들어 있을 때, 첫 번째, 두 번째, 네 번째, 다섯 번째 포도주 잔을 선택하면 총 포도주 양이 33으로 최대로 마실 수 있다.

 입력
 첫째 줄에 포도주 잔의 개수 n이 주어진다. (1 ≤ n ≤ 10,000) 둘째 줄부터 n+1번째 줄까지 포도주 잔에 들어있는 포도주의 양이 순서대로 주어진다. 포도주의 양은 1,000 이하의 음이 아닌 정수이다.

 출력
 첫째 줄에 최대로 마실 수 있는 포도주의 양을 출력한다.
 
예제 입력 1
6
6
10
13
9
8
1

예제 출력 1
33
 
[반례] https://raejoonee.tistory.com/15

6
1
2
3
4
5
6
(첫 잔을 안 마시는 경우)    16

7
2
2
1
1
2
2
1
(마지막 잔을 안 마시는 경우)    8

4
1
2
3
1 (첫 잔과 마지막 잔 둘 다 안 마시는 경우)    5

10
1
1
1
1
1
1
1
1
1
1 (최대한 많은 잔을 마시는 경우)    7

6
1000
1000
1
1
1000
1000
(두 잔 연속 안 마시는 경우)    4000

10
977
200
517
851
23
662
880
815
26
214
(통상적인 경우)    4254

7
1
10
1
10
1
10
1
(답)     32

7
100
1
100
1
100
1
100
(답)     400

7
1
1000
1000
1
1000
1000
1
(답)     4000

9
1
1000
1000
1
1
1
1000
1000
1
(답)     4001
*/
