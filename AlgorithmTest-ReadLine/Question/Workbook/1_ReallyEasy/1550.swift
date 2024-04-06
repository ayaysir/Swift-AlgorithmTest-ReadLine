//
//  1550.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/7/24.
//

// import Foundation

/// 16진수 https://www.acmicpc.net/problem/1550
func Q_1550_() {
    func hex6ToDec(_ numArr: [String]) -> Int {
        let exps = [1_048_576, 65_536, 4_096, 256, 16, 1]
        let startExp = 6 - numArr.count
        let dict = Dictionary(uniqueKeysWithValues: zip("0123456789ABCDEF".map { String($0) }, (0...16)))
        
        return numArr.enumerated().reduce(0) { $0 + dict[$1.element]! * exps[startExp + $1.offset] }
    }

    print(hex6ToDec(readLine()!.map(String.init)))
}

func Q_1550_SHORT() {
    print(Int(readLine()!,radix:16)!)
}

/*
 [풀이] https://www.rapidtables.com/convert/number/hex-to-decimal.html
 Decimal calculation steps (3ABC)
 (3ABC)₁₆ = (3 × 16³) + (10 × 16²) + (11 × 16¹) + (12 × 16⁰) = (15036)₁₀
 
 --------
 
 문제
 16진수 수를 입력받아서 10진수로 출력하는 프로그램을 작성하시오.

 입력
 첫째 줄에 16진수 수가 주어진다. 이 수의 최대 길이는 6글자이다. 16진수 수는 0~9와 A~F로 이루어져 있고, A~F는 10~15를 뜻한다. 또, 이 수는 음이 아닌 정수이다.

 출력
 첫째 줄에 입력으로 주어진 16진수 수를 10진수로 변환해 출력한다.
 
 분류
 - 수학
 - 구현

 예제 입력 1
 A
 예제 출력 1
 10
 */
