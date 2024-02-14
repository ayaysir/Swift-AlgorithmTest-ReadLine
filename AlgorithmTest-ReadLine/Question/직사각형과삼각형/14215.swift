//
//  14215.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/14/24.
//

import Foundation

func Q_14215_OLD() {
    let values = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    let (a, b, c) = (values[0], values[1], values[2])
    
    if (a == b && b == c && c == a) || (a + b) > c {
        print(a + b + c)
    } else if c == a + b {
        if c - 1 < a + b {
            print(a + b + c - 1)
        } else if a == b && a + b <= c {
            print(2 * a + (2 * a - 1))
        } else {
            print(3 * a)
        }
    } else {
        print(a + b + (a + b - 1))
    }
}

func Q_14215() {
    let values = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    let (a, b, c) = (values[0], values[1], values[2])
    
    print(a + b + min(c, a + b - 1))
}

/*
세 막대 https://www.acmicpc.net/problem/14215

예제 입력 1
1 2 3
예제 출력 1
5

예제 입력 2
2 2 2
예제 출력 2
6

예제 입력 3
1 100 1
예제 출력 3
3

예제 입력 4
41 64 16
예제 출력 4
113
 
2 2 9999
 7
 
16 17 18
 51
 
16 19 50
 69
 
 // a == b && a + b <= c인 경우
 // a + b + (a + b - 1)이어야함 (3*a가 아님)
 
9 9 100000~19
 35

9 9 18~9
 (35, 35, 34, 33 ~ 27)
 
9 9 8~1
 (26 ~ 19)
*/
