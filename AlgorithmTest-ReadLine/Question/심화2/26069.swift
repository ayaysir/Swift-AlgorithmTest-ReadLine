//
//  26069.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/12/24.
//

import Foundation

func Q_26069() {
    var danceables: Set<String> = ["ChongChong"]
    
    for _ in 0..<Int(readLine()!)! {
        let pair = readLine()!.split(separator: " ").map { String($0) }
        
        if danceables.contains(pair[0]) {
            danceables.insert(pair[1])
        } else if danceables.contains(pair[1]) {
            danceables.insert(pair[0])
        }
    }
    
    print(danceables.count)
}

/*
 붙임성 좋은 총총이 https://www.acmicpc.net/problem/26069
 - 문제 요약: 둘이 만나는 사교 파티에서 전염된 사람의 개수 카운트, 발원지는 총총이
 */
