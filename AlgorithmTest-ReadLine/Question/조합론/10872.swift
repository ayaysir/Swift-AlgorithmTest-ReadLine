//
//  10872.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/12/24.
//

func Q_10872() {
    func factorial(_ n: Int) -> Int {
        // 종료 조건을 n == 1이 아니고 0인 경우도 포함해야 하므로 n <= 1로 해야함
        // 종료 조건이 n == 1인데 n = 0인 경우 스택 오버플로 발생
        // 0! = 1
        n <= 1 ? 1 : n * factorial(n - 1)
    }
    
    print(factorial(Int(readLine()!)!))
}

func Q_10872_OLD() {
    let list = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600]
    print(list[Int(readLine()!)!])
}


/*
팩토리얼 https://www.acmicpc.net/problem/10872

문제
0보다 크거나 같은 정수 N이 주어진다. 이때, N!을 출력하는 프로그램을 작성하시오.

입력
첫째 줄에 정수 N(0 ≤ N ≤ 12)이 주어진다.

출력
첫째 줄에 N!을 출력한다.

예제 입력 1
10
예제 출력 1
3628800

예제 입력 2
0
예제 출력 2
1
 */
