//
//  2566.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/11/24.
//

import Foundation

func Q_2566() {
    var (r, c, mx) = (0, 0, Int.min)
    
    for i in 1...9 {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        
        for j in 0..<9 {
            if mx < nums[j] {
                mx = nums[j]
                r = i
                c = j + 1
            }
        }
    }
    
    print(mx)
    print(r, c)
}

func Q_2566_SHORT() {
    var(r,c,x)=(0,0,-1)
    for i in 1...9{let a=readLine()!.split{$0==" "}.map{Int($0)!}
    for j in 0..<9 where x<a[j]{x=a[j];r=i;c=j+1}}
    print(x,"\n",r,c)
}

/*
최댓값 https://www.acmicpc.net/problem/2566

예제 입력 1
3 23 85 34 17 74 25 52 65
10 7 39 42 88 52 14 72 63
87 42 18 78 53 45 18 84 53
34 28 64 85 12 16 75 36 55
21 77 45 35 28 75 90 76 1
25 87 65 15 28 11 37 28 74
65 27 75 41 7 89 78 64 39
47 47 70 45 23 65 3 41 44
87 13 82 38 31 12 29 29 80

예제 출력 1
90
5 7
 */
