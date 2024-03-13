//
//  25501.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/13/24.
//

import Foundation

func Q_25501() {
    var callCount = 0
    func recursions(_ wordArr: [String], _ l: Int, _ r: Int) -> Int {
        callCount += 1
        
        if l >= r {
            return 1
        } else if wordArr[l] != wordArr[r] {
            return 0
        }
        
        return recursions(wordArr, l + 1, r - 1)
    }
    
    func isPalindrome(_ word: String) -> Int {
        recursions(word.map(String.init), 0, word.count - 1)
    }
    
    for _ in 0..<Int(readLine()!)! {
        callCount = 0
        print(isPalindrome(readLine()!), callCount)
    }
}

/*
 재귀의 귀재 https://www.acmicpc.net/problem/25501
 - 문제 요약: 팰린드롬 여부 + 재귀 호출 횟수 카운트
 */
