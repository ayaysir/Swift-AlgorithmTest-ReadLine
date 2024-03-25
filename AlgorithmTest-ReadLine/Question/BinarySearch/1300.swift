//
//  1300.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/25/2024.
//
//  6: K번째 수 https://www.acmicpc.net/problem/1300
//

import Foundation

/// K번째 수 https://www.acmicpc.net/problem/1300
func Q_1300() {
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    
    // x는 lo <= x <= hi 의 범위를 갖는다.
    var (lower, upper) = (1, k)
    
    while lower < upper {
        let mid = (lower + upper) / 2
        var count = 0
        
        /*
         *  임의의 x에 대해 i번 째 행을 나눔으로써 x보다 작거나 같은 원소의 개수의 누적 합을 구한다.
         *  이 때 각 행의 원소의 개수가 N(열 개수)를 초과하지 않는 선에서 합해주어야 한다.
         */
        for i in 1...n {
            count += min(n, mid / i)
        }
        
        // lowerBound를 찾는다
        if k <= count {
            upper = mid
        } else {
            lower = mid + 1
        }
    }
    
    print(lower)
}

/*
 [풀이] https://st-lab.tistory.com/281
 
 ------------------
 
 문제
 세준이는 크기가 N×N인 배열 A를 만들었다. 배열에 들어있는 수 A[i][j] = i×j 이다. 이 수를 일차원 배열 B에 넣으면 B의 크기는 N×N이 된다. B를 오름차순 정렬했을 때, B[k]를 구해보자.

 배열 A와 B의 인덱스는 1부터 시작한다.

 입력
 첫째 줄에 배열의 크기 N이 주어진다. N은 105보다 작거나 같은 자연수이다. 둘째 줄에 k가 주어진다. k는 min(109, N2)보다 작거나 같은 자연수이다.

 출력
 B[k]를 출력한다.

 예제 입력 1
 3
 7
 
 예제 출력 1
 6
 */
