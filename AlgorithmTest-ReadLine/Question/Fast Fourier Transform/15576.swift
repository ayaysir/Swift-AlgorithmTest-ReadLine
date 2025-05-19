//
//  15576.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 5/19/25.
//
//  5: 큰 수 곱셈 (2) https://www.acmicpc.net/problem/15576
//

import Foundation

func Q_15576() {
  let input = readLine()!.split(separator: " ").map { String($0) }
  let (a, b) = (input[0], input[1])
  
  if a.count == 1 || b.count == 1 {
    print(Int(a)! * Int(b)!)
    return
  }
  
  var sa: [Complex] = []
  for i in stride(from: a.count - 1, through: 0, by: -1) {
    let strIndex = a.index(a.startIndex, offsetBy: i)
    let chrStr = String(a[strIndex])
    sa.append(.init(Double(chrStr)!, 0))
  }
  
  var sb: [Complex] = []
  for i in stride(from: b.count - 1, through: 0, by: -1) {
    let strIndex = b.index(b.startIndex, offsetBy: i)
    let chrStr = String(b[strIndex])
    sb.append(.init(Double(chrStr)!, 0))
  }
  
  let conv = convolutionII(sa, sb)
  var result = Array(repeating: 0, count: conv.count)
  var carry = 0
  for i in 0..<conv.count {
    let val = Int(round(conv[i].re)) + carry
    result[i] = val % 10
    carry = val / 10
  }
  
  while carry > 0 {
    result.append(carry % 10)
    carry /= 10
  }

  while result.count > 1 && result.last! == 0 {
    result.removeLast()
  }
  
  result.reverse()
  
  print(result.map(String.init).joined())
}

