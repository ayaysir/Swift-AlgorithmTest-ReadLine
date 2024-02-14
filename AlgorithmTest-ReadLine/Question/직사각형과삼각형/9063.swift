//
//  9063.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/14/24.
//

import Foundation

func Q_9063() {
    // 임씨의 이름이 새겨진 옥구슬이 나오는 모든 지점을 포함하는 가장 작은 남북, 동서 방향으로 평행한 변을 갖는 직사각형의 대지를 임씨의 소유로 인정한다.
    var (xMin, yMin, xMax, yMax) = (Int.max, Int.max, Int.min, Int.min)
    for _ in 0..<Int(readLine()!)! {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        xMin = min(xMin, r[0])
        xMax = max(xMax, r[0])
        yMin = min(yMin, r[1])
        yMax = max(yMax, r[1])
    }
    
    // print(xMin != xMax && yMin != yMax ? (xMax - xMin) * (yMax - yMin) : 0)
    print((xMax - xMin) * (yMax - yMin)) // 어차피 한 쌍이라도 같은 값이면 0
}
