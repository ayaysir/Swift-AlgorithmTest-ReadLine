//
//  11478.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/22/24.
//

import Foundation

func Q_11478() {
    let s = readLine()!.map(String.init)
    var set = Set<String>()

    for i in s.indices {
        var sliced = ""
        for j in i..<s.count {
            sliced += s[j]
            set.insert(sliced)
        }
    }

    print(set.count)
}

/*
 [해설]
 - 조합을 따지는 게 아니라 연속되는 부분 문자열임
 - 부분 문자열 뽑기 => for i in s.indices, for j in i..<s.count
 - i =>  0             1            2           3       4
 - j =>  0,1,2,3,4     1,2,3,4      2,3,4       3,4     4
 - set=> a,ab,aba,     b,ba,bab,    a,ab,abc    b,bc    c
         abab,ababc    babc
 - 중복을 거른것의 개수
 
 서로 다른 부분 문자열의 개수 https://www.acmicpc.net/problem/11478
 
 문제
 문자열 S가 주어졌을 때, S의 서로 다른 부분 문자열의 개수를 구하는 프로그램을 작성하시오.

 부분 문자열은 S에서 연속된 일부분을 말하며, 길이가 1보다 크거나 같아야 한다.

 예를 들어, ababc의 부분 문자열은 a, b, a, b, c, ab, ba, ab, bc, aba, bab, abc, abab, babc, ababc가 있고, 서로 다른것의 개수는 12개이다.

 입력
 첫째 줄에 문자열 S가 주어진다. S는 알파벳 소문자로만 이루어져 있고, 길이는 1,000 이하이다.

 출력
 첫째 줄에 S의 서로 다른 부분 문자열의 개수를 출력한다.

 예제 입력 1
 ababc
 예제 출력 1
 12

 */
