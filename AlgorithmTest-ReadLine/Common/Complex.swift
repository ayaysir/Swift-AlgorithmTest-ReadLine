//
//  Complex.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 5/19/25.
//

import Foundation

/// `Complex` 구조체는 **복소수(Complex Number)**를 표현하기 위한 사용자 정의 타입입니다. Swift 5.5에는 복소수를 기본으로 지원하는 타입이 없기 때문에, 직접 구조체를 만들어야 합니다.
/// - Parameters:
///   - re: 실수(real) 부분
///   - im: 허수(imaginary) 부분
struct Complex {
  var re: Double
  var im: Double

  init(_ re: Double, _ im: Double) {
    self.re = re
    self.im = im
  }

  static func + (a: Complex, b: Complex) -> Complex {
    return Complex(a.re + b.re, a.im + b.im)
  }

  static func - (a: Complex, b: Complex) -> Complex {
    return Complex(a.re - b.re, a.im - b.im)
  }

  static func * (a: Complex, b: Complex) -> Complex {
    return Complex(a.re * b.re - a.im * b.im, a.re * b.im + a.im * b.re)
  }

  static func / (a: Complex, b: Double) -> Complex {
    return Complex(a.re / b, a.im / b)
  }
  
  /// 복합 연산자 (곱셈)
  static func *= (a: inout Complex, b: Complex) {
    a = a * b
  }
  
  /// 복합 연산자 (나눗셈)
  static func /= (a: inout Complex, b: Double) {
    a = a / b
  }
}
