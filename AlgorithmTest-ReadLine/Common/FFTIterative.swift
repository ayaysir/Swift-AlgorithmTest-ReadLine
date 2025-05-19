//
//  FFTIterative.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 5/19/25.
//

import Foundation

func fftIterative(_ a: inout [Complex], invert: Bool) {
  let n = a.count
  // 1. 비트 반전(permutation)
  var j = 0
  for i in 1..<n {
    var bit = n >> 1
    while j & bit != 0 {
      j ^= bit
      bit >>= 1
    }
    j |= bit
    if i < j {
      a.swapAt(i, j)
    }
  }

  // 2. FFT 수행
  var len = 2
  while len <= n {
    let angle = 2 * Double.pi / Double(len) * (invert ? -1 : 1)
    let wlen = Complex(cos(angle), sin(angle))
    for i in stride(from: 0, to: n, by: len) {
      var w = Complex(1, 0)
      for j in 0..<(len/2) {
        let u = a[i + j]
        let v = a[i + j + len/2] * w
        a[i + j] = u + v
        a[i + j + len/2] = u - v
        w *= wlen
      }
    }
    len <<= 1
  }

  // 3. 역변환 스케일링
  if invert {
    for i in 0..<n {
      a[i] /= Double(n)
    }
  }
}

func nextPowerOfTwo(_ x: Int) -> Int {
  let bitWidth = Int.bitWidth
  let leadingZeros = (x - 1).leadingZeroBitCount
  return 1 << (bitWidth - leadingZeros)
}

func convolutionII(_ a: [Complex], _ b: [Complex]) -> [Complex] {
  let n = nextPowerOfTwo(a.count + b.count)
  
  // 배열 길이를 FFT에 맞게 확장 (2의 거듭제곱 n까지 0으로 패딩)
  var fa = a + [Complex](repeating: Complex(0, 0), count: n - a.count)
  var fb = b + [Complex](repeating: Complex(0, 0), count: n - b.count)
  
  // 정방향 FFT 실행
  fftIterative(&fa, invert: false)
  fftIterative(&fb, invert: false)
  
  //주파수 영역에서 요소별 곱
  for i in 0..<n {
    fa[i] *= fb[i]
  }
  
  // 역 FFT 실행 (주파수 → 시간)
  fftIterative(&fa, invert: true)
  
  // 결과 복원 생략 (=> 문제풀이에서 Int(round(x.re)) 로 복원)
  
  return fa
}
