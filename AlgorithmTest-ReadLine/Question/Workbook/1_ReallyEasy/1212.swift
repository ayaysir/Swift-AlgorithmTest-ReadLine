//
//  1212.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/6/24.
//

// import Foundation


/// 8진수 2진수 https://www.acmicpc.net/problem/1212
func Q_1212() {
    func oct1ToBin3(_ n: Int, isLeadingZero: Bool = true) -> String? {
        guard 0...7 ~= n else {
            return nil
        }
        
        var n = n, arr = [Int]()
        while n >= 1 {
            arr.append(n % 2)
            n /= 2
        }
        
        for _ in stride(from: 0, to: 3 - arr.count, by: 1) where isLeadingZero {
            arr.append(0)
        }
        
        return arr.reversed().map(String.init).joined()
    }
    
    func solution() -> String {
        let octal = readLine()!.map { Int(String($0))! }
        
        guard let first = octal.first, first != 0 else {
            return "0"
        }
        
        return octal.enumerated().map { i, n in  oct1ToBin3(n, isLeadingZero: i != 0)! }.joined()
    }
    
    print(solution())
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
 8진수가 주어졌을 때, 2진수로 변환하는 프로그램을 작성하시오.

 입력
 첫째 줄에 8진수가 주어진다. 주어지는 수의 길이는 333,334을 넘지 않는다.

 출력
 첫째 줄에 주어진 수를 2진수로 변환하여 출력한다. 수가 0인 경우를 제외하고는 반드시 1로 시작해야 한다.
 
 분류
 - 수학
 - 구현
 - 문자열

 예제 입력 1
 314
 
 예제 출력 1
 11001100
 */
