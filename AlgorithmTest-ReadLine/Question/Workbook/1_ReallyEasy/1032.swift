//
//  1032.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/5/24.
//

import Foundation

/// 명령 프롬프트 https://www.acmicpc.net/problem/1032
func Q_1032() {
    print((0..<Int(readLine()!)!).enumerated().reduce([String]()){a,e in let l=readLine()!.map(String.init);return e.offset==0 ?l:l.indices.map{i in a[i]==l[i] ?a[i]:"?"}}.joined())
}

/*
 입력
 첫째 줄에 파일 이름의 개수 N이 주어진다. 둘째 줄부터 N개의 줄에는 파일 이름이 주어진다. N은 50보다 작거나 같은 자연수이고 파일 이름의 길이는 모두 같고 길이는 최대 50이다. 파일이름은 알파벳 소문자와 '.' 로만 이루어져 있다.

 출력
 첫째 줄에 패턴을 출력하면 된다.
 
 분류
 - 구현
 - 문자열

 예제 입력 1
 3
 config.sys
 config.inf
 configures
 예제 출력 1
 config????
 
 예제 입력 2
 2
 contest.txt
 context.txt
 예제 출력 2
 conte?t.txt
 
 예제 입력 3
 3
 c.user.mike.programs
 c.user.nike.programs
 c.user.rice.programs
 예제 출력 3
 c.user.?i?e.programs
 
 예제 입력 4
 4
 a
 a
 b
 b
 예제 출력 4
 ?
 
 예제 입력 5
 1
 onlyonefile
 예제 출력 5
 onlyonefile
 */
