//
//  1193.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/12/24.
//

import Foundation

func Q_1193() {
    let n = Int(readLine()!)!
    var start = 0, end = 0
    var increment = 0
    
    while true {
        start = end + 1
        end = start + increment
        
        // n이 start...end 사이에 있으면
        if start...end ~= n {
            let denominator = n - start + 1
            let numerator = (end - start + 2) - denominator
            print(increment % 2 == 0 ? "\(numerator)/\(denominator)" : "\(denominator)/\(numerator)")
            break
        }
        
        increment += 1
    }
}

/*
분수찾기 https://www.acmicpc.net/problem/1193
 
 [규칙].......................분자분모합 increment
 1                            => 2    0
 (1/1)
 2 3                          => 3    1
 (1/2), (2/1)
 4 5 6                        => 4    2
 (3/1), (2/2), (1/3)
 7 8 9 10                     => 5    3
 (1/4), (2/3), (3/2), (4/1)
 
 인데 
 
 분자 분모 합이 짝수이면 (=> increment가 짝수이면)
 = (분자가 감소)/(분모가 증가)
 
 분자 분모 합이 홀수이면 (=> increment가 홀수이면)
 = (분자가 증가)/(분모가 감소)
 
 이므로 주의
 
 ======================

문제
무한히 큰 배열에 다음과 같이 분수들이 적혀있다.

1/1    1/2    1/3    1/4    1/5    …
2/1    2/2    2/3    2/4    …    …
3/1    3/2    3/3    …    …    …
4/1    4/2    …    …    …    …
5/1    …    …    …    …    …
…    …    …    …    …    …
 
이와 같이 나열된 분수들을 1/1 → 1/2 → 2/1 → 3/1 → 2/2 → … 과 같은 지그재그 순서로 차례대로 1번, 2번, 3번, 4번, 5번, … 분수라고 하자.

X가 주어졌을 때, X번째 분수를 구하는 프로그램을 작성하시오.

입력
첫째 줄에 X(1 ≤ X ≤ 10,000,000)가 주어진다.

출력
첫째 줄에 분수를 출력한다.
 
예제 입력 1
1/1
 
예제 입력 2 ~ 3
1/2
2/1
 
예제 입력 4 ~ 6
3/1
2/2
1/3
 
예제 입력 7 ~ 10
1/4
2/3
3/2
4/1
 
예제 입력 11 ~ 15
5/1
4/2
3/3
2/4
1/5
*/
