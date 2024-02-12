//
//  2720.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/12/24.
//

// import Foundation

func Q_2720_OLD() {
    let coins = [25, 10, 5, 1]
    
    for _ in 0..<Int(readLine()!)! {
        var received = Int(readLine()!)!
        var toGiveCoins = [0, 0, 0, 0]
        var index = 0
        
        while received > 0 {
            let giveCount = received / coins[index]
            toGiveCoins[index] += giveCount
            // received -= coins[index] * giveCount
            received %= coins[index]
            index += 1
        }
        
        print(toGiveCoins.map(String.init).joined(separator: " "))
    }
}

func Q_2720() {
    for _ in 0..<Int(readLine()!)! {
        var remain = Int(readLine()!)!
        
        print([25, 10, 5, 1].map {
            let giveCount = "\(remain / $0) "
            remain %= $0
            return giveCount
        }.joined())
    }
}

func Q_2720_SHORT() {
    for _ in 0..<Int(readLine()!)!{
        var r=Int(readLine()!)!,s=""
        _=[25,10,5,1].map{s+="\(r/$0) ";r%=$0}
        print(s)
    }
}

/*
 세탁소 사장 동혁 https://www.acmicpc.net/problem/2720
 거스름돈 문제
 
 예제 입력 1
3
124
25
194
 
 예제 출력 1
 4 2 0 4
 1 0 0 0
 7 1 1 4
 */
