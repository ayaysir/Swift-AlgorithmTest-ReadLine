//
//  1067.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 5/17/25.
//

import Foundation

func Q_1067() {
  let _ = readLine()
  let X = readLine()!.split(separator: " ").map { Int($0)! }
  let Y = readLine()!.split(separator: " ").map { Int($0)! }
  
  // 1. X는 그대로 사용
  
  // 2. Y는 뒤집어서 2배 길이로 불림
  let yRev = Array(Y.reversed())
  let yExt = yRev + yRev
  
  // 3. X와 Y의 컨볼루션 수행
  let conv = convolution(X, yExt) // 반올림한 정수 배열 반환
  print(conv.max()!)
}
