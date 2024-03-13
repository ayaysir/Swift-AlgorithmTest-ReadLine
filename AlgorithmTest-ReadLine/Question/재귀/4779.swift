//
//  4779.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/13/24.
//

import Foundation

func Q_4779() {
    // import Foundation
    
    while let r = readLine() {
        let n = Int(r)!
        
        if n == 0 {
            print("-")
            continue
        }
        
        print(punchLine(powInt(3, n)))
    }
    
    func powInt(_ x: Int, _ y: Int) -> Int {
        Int(pow(Double(x), Double(y)))
    }
    
    func punchLine(_ count: Int) -> String {
        guard count % 3 == 0 else {
            return "" // 절대 있어선 안될일
        }
        
        if count == 3 {
            return "- -"
        }
        
        return punchLine(count / 3)
        + String(repeating: " ", count: count / 3)
        + punchLine(count / 3)
    }
}

/*
 칸토어 집합 https://www.acmicpc.net/problem/4779
 - 문제 요약: 3^n개의 "-"로 이루어진 선을 마지막 3개 문자의 "- -"이 남을때까지 세등분 (선 - 공백 - 선)
 
 예제 입력 및 출력
 0              -
 1              - -
 3              - -   - -         - -   - -
 2              - -   - -
 */
