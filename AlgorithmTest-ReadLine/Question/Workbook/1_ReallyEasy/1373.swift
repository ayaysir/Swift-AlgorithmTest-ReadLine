//
//  1373.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/7/24.
//

// import Foundation

/// 2진수 8진수 https://www.acmicpc.net/problem/1373
func Q_1373() {
    func bin3toOct1(_ numArr: [String]) -> Int {
        let exps = [4, 2, 1]
        let startExp = 3 - numArr.count
        var result = 0
        
        for i in numArr.indices {
            result += Int(numArr[i])! * exps[startExp + i]
        }
        
        return result
        
    }
    
    let binArr = readLine()!.map(String.init)
    let strider = stride(from: binArr.count - 1, through: 0, by: -3)
    
    print(strider.map { i in String(bin3toOct1(Array(i <= 2 ? binArr[0...i] : binArr[i-2...i]))) }.reversed().joined())
    
}

/*
 [풀이] https://www.rapidtables.com/convert/number/octal-to-binary.html
 Convert each octal digit to 3 binary digits (see conversion table below):
 314
 = 3 1 4
 = 11 001 100
 = 11001100
 
 -------
 
 문제
 2진수가 주어졌을 때, 8진수로 변환하는 프로그램을 작성하시오.

 입력
 첫째 줄에 2진수가 주어진다. 주어지는 수의 길이는 1,000,000을 넘지 않는다.

 출력
 첫째 줄에 주어진 수를 8진수로 변환하여 출력한다.
 
 분류
 - 수학
 - 문자열

 예제 입력 1
 11001100
 
 예제 출력 1
 314
 */
