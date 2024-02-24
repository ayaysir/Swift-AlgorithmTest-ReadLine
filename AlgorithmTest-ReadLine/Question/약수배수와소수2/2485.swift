//
//  2485.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/24/24.
//

import Foundation

func Q_2485() {
    func findGCD(_ a: Int, _ b: Int) -> Int {
        (a % b == 0) ? b : findGCD(b, a % b)
    }
    
    func findGCDArray(_ a: [Int], _ start: Int, _ count: Int) -> Int {
        switch count {
        case 1:
            return a[0]
        case 2:
            return findGCD(a[start], a[start + 1])
        default:
            return findGCD(a[start], findGCDArray(a, start + 1, count - 1))
            
        }
    }
    
    var dists: [Int] = [], prev = 0
    for i in 0..<Int(readLine()!)! {
        if i == 0 {
            prev = Int(readLine()!)!
        } else {
            let coord = Int(readLine()!)!
            dists.append(coord - prev)
            prev = coord
        }
    }
    
    let gcd = findGCDArray(dists, 0, dists.count)
    print(gcd, dists.reduce(0) { $0 + ($1 / gcd - 1) })
    
}

/*
 가로수 https://www.acmicpc.net/problem/2485
 
 [풀이]
 https://beginnerdeveloper-lit.tistory.com/39
 - 거리들의 최대공약수 구함 => 거리들을 일정하게 만들어야하기 때문에
 - 거리 / 최대공약수 - 1을 전부 더함
   - (-1) 하는 이유: 양 끝에 이미 심어져 있으므로
 
 [반례]
 
 5
 1
 4
 11
 19
 
 28
 */


