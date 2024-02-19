//
//  24313.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/19/24.
//

import Foundation

func Q_24313() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (a1, a0) = (r[0], r[1])
    let c = Int(readLine()!)!
    let n0 = Int(readLine()!)!
    
    print(a1 * n0 + a0 <= n0 * c && c >= a1 ? 1 : 0)
    /*
     c < a1인 경우 성립하지 않는다. => c >= a1이어야 한다.
     - 상한이 지정된 것은 n0이지 n이 아닙니다. n은 n0 이상 무한대까지의 값을 가질 수 있는데, n이 아무리 크더라도 a0 + a1*n이 c*n 이하여야 한다는 게 조건입니다.
     - c = 5, a1 = 6, a0 = -100인 경우, n = 101을 선택하면 무조건 조건을 어기게 됩니다. (506 <= 505)(X)
     */
}

func Q_24313_SHORT() {
    let r=readLine()!.split{$0==" "}.map{Int($0)!},a=r[0],q=r[1],c=Int(readLine()!)!,n=Int(readLine()!)!
    print(a*n+q<=n*c&&c>=a ?1:0)
}

/*
알고리즘 수업 - 점근적 표기 1

문제
오늘도 서준이는 점근적 표기 수업 조교를 하고 있다. 아빠가 수업한 내용을 학생들이 잘 이해했는지 문제를 통해서 확인해보자.

알고리즘의 소요 시간을 나타내는 O-표기법(빅-오)을 다음과 같이 정의하자.

O(g(n)) = {f(n) | 모든 n ≥ n0에 대하여 f(n) ≤ c × g(n)인 양의 상수 c와 n0가 존재한다}

이 정의는 실제 O-표기법(https://en.wikipedia.org/wiki/Big_O_notation)과 다를 수 있다.

함수 f(n) = a1n + a0, 양의 정수 c, n0가 주어질 경우 O(n) 정의를 만족하는지 알아보자.

입력
첫째 줄에 함수 f(n)을 나타내는 정수 a1, a0가 주어진다. (0 ≤ |ai| ≤ 100)

다음 줄에 양의 정수 c가 주어진다. (1 ≤ c ≤ 100)

다음 줄에 양의 정수 n0가 주어진다. (1 ≤ n0 ≤ 100)

출력
f(n), c, n0가 O(n) 정의를 만족하면 1, 아니면 0을 출력한다.

예제 입력 1
7 7
8
1

예제 출력 1
0

f(n) = 7n + 7, g(n) = n, c = 8, n0 = 1이다. f(1) = 14, c × g(1) = 8이므로 O(n) 정의를 만족하지 못한다.

예제 입력 2
7 7
8
10

예제 출력 2
1

f(n) = 7n + 7, g(n) = n, c = 8, n0 = 10이다. 모든 n ≥ 10에 대하여 7n + 7 ≤ 8n 이므로 O(n) 정의를 만족한다.
*/
