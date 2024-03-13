//
//  11729.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/13/24.
//

import Foundation

func Q_11729() {
    var result = "", count = 0
    func hanoi(_ n: Int, _ from: String, _ via: String, _ to: String) {
        count += 1
        
        if n == 1 {
            result.write("\(from) \(to)\n")
            return
        }
        
        hanoi(n - 1, from, to, via)
        result.write("\(from) \(to)\n")
        hanoi(n - 1, via, from, to)
    }
    
    hanoi(Int(readLine()!)!, "1", "2", "3")
    print(count)
    print(result)
}

/*
[풀이]
https://velog.io/@younghoondoodoom/백준-11729-하노이-탑-이동-순서
n = 원판의 개수
1. 가장 큰 원판이 C로 가려면 n-1개의 원판(나머지 원판)들이 A에서 B로 가야한다.
 - 첫번째 호출 (from -> to)
2. 그리고 A에 있는 가장 큰 원판이 C로 이동해야한다.
 - 중간의 write (from -> to)
3. B에 있는 n-1개의 원판을 C로 이동한다.
 - 마지막 호출 (from -> to)

------------------

하노이의 탑 https://www.acmicpc.net/problem/11729

세 개의 장대가 있고 첫 번째 장대에는 반경이 서로 다른 n개의 원판이 쌓여 있다. 각 원판은 반경이 큰 순서대로 쌓여있다. 이제 수도승들이 다음 규칙에 따라 첫 번째 장대에서 세 번째 장대로 옮기려 한다.

한 번에 한 개의 원판만을 다른 탑으로 옮길 수 있다.
쌓아 놓은 원판은 항상 위의 것이 아래의 것보다 작아야 한다.
이 작업을 수행하는데 필요한 이동 순서를 출력하는 프로그램을 작성하라. 단, 이동 횟수는 최소가 되어야 한다.

입력
첫째 줄에 첫 번째 장대에 쌓인 원판의 개수 N (1 ≤ N ≤ 20)이 주어진다.

출력
첫째 줄에 옮긴 횟수 K를 출력한다.

두 번째 줄부터 수행 과정을 출력한다. 두 번째 줄부터 K개의 줄에 걸쳐 두 정수 A B를 빈칸을 사이에 두고 출력하는데, 이는 A번째 탑의 가장 위에 있는 원판을 B번째 탑의 가장 위로 옮긴다는 뜻이다.

예제 입력 1
3

예제 출력 1
7
1 3
1 2
3 2
1 3
2 1
2 3
1 3
*/
