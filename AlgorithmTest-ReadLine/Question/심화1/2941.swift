//
//  2941.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/10/24.
//

import Foundation

func Q_2941() {
    let word = readLine()!
    let regex = try! NSRegularExpression(pattern: "(c=|c-|dz=|d-|lj|nj|s=|z=)", options: [.caseInsensitive])
    let modified = regex.stringByReplacingMatches(in: word, range: .init(word.startIndex..., in: word), withTemplate: "*")

    print(modified.count)
}

/*
예제 입력 1
ljes=njak
예제 출력 1
6
 
예제 입력 2
ddz=z=
예제 출력 2
3
 
예제 입력 3
nljj
예제 출력 3
3
 
예제 입력 4
c=c=
예제 출력 4
2
 
예제 입력 5
dz=ak
예제 출력 5
3
 */
