//
//  2839.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/20/24.
//

import Foundation

func Q_2839() {
    let n = Int(readLine()!)!
    
    if n % 3 == 0, n <= 12 {
        print(n / 3)
    } else {
        for i in stride(from: n / 5, through: 0, by: -1) {
            let fivePackages = 5 * i
            let remain = n - fivePackages
            
            if remain == 0 {
                print(i)
                break
            }
            
            if remain % 3 == 0 {
                print(i + remain / 3)
                break
            }
            
            if i == 0 {
                print(-1)
            }
        }
    }
}

/*
 예제 입력 1
 18
 예제 출력 1
 4
 
 예제 입력 2
 4
 예제 출력 2
 -1
 
 예제 입력 3
 6
 예제 출력 3
 2
 
 예제 입력 4
 9
 예제 출력 4
 3
 
 예제 입력 5
 11
 예제 출력 5
 3
 */
