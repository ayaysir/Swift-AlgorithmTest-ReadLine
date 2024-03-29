//
//  1541.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/20/2024.
//
//  4: 잃어버린 괄호 https://www.acmicpc.net/problem/1541
//

// import Foundation

/// 잃어버린 괄호 https://www.acmicpc.net/problem/1541
func Q_1541() {
    let queue = readLine()!.split{ $0 == "-" }.map { str in
        Int(str) != nil ? Int(str)! : str.split{ $0 == "+" }.map { Int($0)! }.reduce(0, +)
    }

    print(queue[1...].reduce(queue[0], -))
}

/*
 [풀이] https://2nyongs.tistory.com/14
 - 최소값을 얻기 위해서는 되도록 큰 수를, 그리고 여러번 빼줘야한다.
 - 마이너스(-)를 찾은 뒤 그 뒤를 괄호로 묶고 더한 뒤 빼주면 가장 큰 수를 뺼 수 있다.
   - 예) 55-50+40을 55-(50+40)으로 묶는다. (결과 -35)
   - 같은 부호는 연달아 나오지 않는다.
 
 이를 코드로 구현하기 위해서 아래와 같은 순서로 진행하였다.
 1. 주어진 식을 ( - )를 기준으로 나눈다.
   => "55-50+40" ---> ["55", "50+40"]
 2. 분리된 식의 각 조각을 계산한다.
   => ["55", "50+40"] ---> [55, 90]
 3. 2에서 얻은 첫 번째 값에서 나머지 값을 모두 빼준다.
   => 55 - 90 = -35
 
 ------------
 
 문제
 세준이는 양수와 +, -, 그리고 괄호를 가지고 식을 만들었다. 그리고 나서 세준이는 괄호를 모두 지웠다.

 그리고 나서 세준이는 괄호를 적절히 쳐서 이 식의 값을 최소로 만들려고 한다.

 괄호를 적절히 쳐서 이 식의 값을 최소로 만드는 프로그램을 작성하시오.

 입력
 첫째 줄에 식이 주어진다. 식은 ‘0’~‘9’, ‘+’, 그리고 ‘-’만으로 이루어져 있고, 가장 처음과 마지막 문자는 숫자이다. 그리고 연속해서 두 개 이상의 연산자가 나타나지 않고, 5자리보다 많이 연속되는 숫자는 없다. 수는 0으로 시작할 수 있다. 입력으로 주어지는 식의 길이는 50보다 작거나 같다.

 출력
 첫째 줄에 정답을 출력한다.

 예제 입력 1
 55-50+40
 예제 출력 1
 -35
 
 예제 입력 2
 10+20+30+40
 예제 출력 2
 100
 
 예제 입력 3
 00009-00009
 예제 출력 3
 0
 */
