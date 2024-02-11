//
//  2563.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/11/24.
//

import Foundation

func Q_2563() {
    var paper: [[Int]] = .init(repeating: .init(repeating: 0, count: 101), count: 101)
    for _ in 0..<Int(readLine()!)! {
        let coord = readLine()!.split(separator: " ").map { Int($0)! }
        for i in coord[1]..<coord[1] + 10 {
            for j in coord[0]..<coord[0] + 10 {
                paper[i][j] = 1
            }
        }
    }
    
    print(paper.flatMap{$0}.reduce(0, +))
    
    // 열, 행 위치를 착각했다 하더라도 어차피 넓이를 구하는 문제이고,
    // 모두 다 상대적으로 같이 움직이므로 문제 없음(?)
}

func Q_2563_SHORT() {
    var a=Array(repeating:[Int](repeating:0,count:101),count:101)
    for _ in 0..<Int(readLine()!)!{let p=readLine()!.split{$0==" "}.map{Int($0)!},(r,c)=(p[0],p[1])
    for i in c..<c+10{for j in r..<r+10{a[i][j]=1}}}
    print(a.flatMap{$0}.reduce(0,+))
}

/*
색종이 https://www.acmicpc.net/problem/2563
 
예제 입력 1
3
3 7
15 7
5 2
 
예제 출력 1
260
*/
