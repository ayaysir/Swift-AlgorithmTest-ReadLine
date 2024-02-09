//
//  2908.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/9/24.
//

import Foundation

func Q_2908() {
    let inputs = readLine()!.split(separator: " ")
    let reversed1 = Int(String(inputs[0].reversed()))!
    let reversed2 = Int(String(inputs[1].reversed()))!
    print(max(reversed1, reversed2))
    
    // 팁: Int로 바꾸지 않고 String 상태에서 숫자비교해도 큰 값을 찾을 수 있음
    // max(String(inputs[0].reversed()), String(inputs[1].reversed()))
}
