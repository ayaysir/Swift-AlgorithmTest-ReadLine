//
//  11399.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/10/26.
//

import Foundation

/*
 ATM
 https://www.acmicpc.net/problem/11399
 */

func Q_11399() {
    _ = readLine()
    let queue = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    print(queue.reduce([0, 0]) { [$0[0] + $1, $0[1] + $0[0] + $1] }[1])
}

func Q_11399_SHORT() {
    // _=readLine()
    // print(readLine()!.split{$0==" "}.map{Int($0)!}.sorted().reduce([0,0]){a,b in [a[0]+b,a[1]+a[0]+b]}[1])
    
    // readLine();var s=0,d=0;readLine()!.split{$0==" "}.map{Int($0)!}.sorted().map{d+=$0;s+=d}
    // print(s)
    
}

func Q_11399_OLD() {
    _ = Int(readLine()!)!
    let elapsedTimes: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    
    var accTime = 0
    var waitingTimes: [Int] = []
    
    for elapsedTime in elapsedTimes {
        accTime += elapsedTime
        waitingTimes.append(accTime)
    }
    
    let totalElapsedTime = waitingTimes.reduce(0) {
        $0 + $1
    }
    
    print(totalElapsedTime)
}

/*
 [풀이]
 - 앞의 사람수에 따라 기다리는 시간이 누적되므로 대기시간이 짧은 사람이 앞에 서는게 낫다
 예) 5+.4+..3+...2+....1 = 55 이나 1+.2+..3+...4+...5 = 25
 
 -------------------
 
 ATM 성공 https://www.acmicpc.net/problem/11399
 
 시간 제한    메모리 제한    제출    정답    맞힌 사람    정답 비율
 1 초    256 MB    110324    75281    59930    68.607%
 
 문제
 인하은행에는 ATM이 1대밖에 없다. 지금 이 ATM앞에 N명의 사람들이 줄을 서있다. 사람은 1번부터 N번까지 번호가 매겨져 있으며, i번 사람이 돈을 인출하는데 걸리는 시간은 Pi분이다.

 사람들이 줄을 서는 순서에 따라서, 돈을 인출하는데 필요한 시간의 합이 달라지게 된다. 예를 들어, 총 5명이 있고, P1 = 3, P2 = 1, P3 = 4, P4 = 3, P5 = 2 인 경우를 생각해보자. [1, 2, 3, 4, 5] 순서로 줄을 선다면, 1번 사람은 3분만에 돈을 뽑을 수 있다. 2번 사람은 1번 사람이 돈을 뽑을 때 까지 기다려야 하기 때문에, 3+1 = 4분이 걸리게 된다. 3번 사람은 1번, 2번 사람이 돈을 뽑을 때까지 기다려야 하기 때문에, 총 3+1+4 = 8분이 필요하게 된다. 4번 사람은 3+1+4+3 = 11분, 5번 사람은 3+1+4+3+2 = 13분이 걸리게 된다. 이 경우에 각 사람이 돈을 인출하는데 필요한 시간의 합은 3+4+8+11+13 = 39분이 된다.

 줄을 [2, 5, 1, 4, 3] 순서로 줄을 서면, 2번 사람은 1분만에, 5번 사람은 1+2 = 3분, 1번 사람은 1+2+3 = 6분, 4번 사람은 1+2+3+3 = 9분, 3번 사람은 1+2+3+3+4 = 13분이 걸리게 된다. 각 사람이 돈을 인출하는데 필요한 시간의 합은 1+3+6+9+13 = 32분이다. 이 방법보다 더 필요한 시간의 합을 최소로 만들 수는 없다.

 줄을 서 있는 사람의 수 N과 각 사람이 돈을 인출하는데 걸리는 시간 Pi가 주어졌을 때, 각 사람이 돈을 인출하는데 필요한 시간의 합의 최솟값을 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 사람의 수 N(1 ≤ N ≤ 1,000)이 주어진다. 둘째 줄에는 각 사람이 돈을 인출하는데 걸리는 시간 Pi가 주어진다. (1 ≤ Pi ≤ 1,000)

 출력
 첫째 줄에 각 사람이 돈을 인출하는데 필요한 시간의 합의 최솟값을 출력한다.

 예제 입력 1
 5
 3 1 4 3 2
 예제 출력 1
 32
 */
