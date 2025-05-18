//
//  20176.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 5/18/25.
//

import Foundation

func Q_20176() {
  _ = readLine()
  let Nus = readLine()!.split(separator: " ").map { Int($0)! }
  _ = readLine()
  let Nms = readLine()!.split(separator: " ").map { Int($0)! }
  _ = readLine()
  let Nls = readLine()!.split(separator: " ").map { Int($0)! }
  
  let bias = 30_000
  var upperFreq = [Int](repeating: 0, count: bias * 2 + 1)
  var lowerFreq = [Int](repeating: 0, count: bias * 2 + 1)
  
  // 1. 윗벽 아랫벽 구멍 x좌표를 기반으로 upperFreq, lowerFreq 생성
  for n in Nus {
    upperFreq[n + bias] = 1
  }
  
  for n in Nls {
    lowerFreq[n + bias] = 1
  }
  
  // 2. upperFreq, lowerFreq 컨볼루션
  let conv = convolution(upperFreq, lowerFreq)
  
  // 3. 중간 벽의 x좌표를 이용해 결과 집계
  var result = 0
  for nm in Nms {
    let sum = 2 * (nm + bias) // 인덱스를 맞춰야 함
    result += conv[sum]
  }
  
  print(result)
}
